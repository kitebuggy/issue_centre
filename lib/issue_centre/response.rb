module IssueCentre
  class Response
    
    attr_accessor :id, :response_savon, :session_key, :status
    
    class << self
      
      # Parse the response retrieved during any request.
      #
      # @param [XML] savon_response Savon's representation of the
      # response
      #
      # @param [Hash] options Any default attributes that should be
      # added to the model
      # 
      # @return [Response] Response object with combined response details
      #
      def parse( savon_response, options = {})
        response = IssueCentre::Response.new
        response.response_savon = savon_response
      
        embedded_xml = savon_response.xpath( '//return')
      
        # check for responses we don't understand
        if embedded_xml.blank?
          raise IssueCentre::ParseError.new( savon_response.body.keys.first)
        end

        doc = Nokogiri::XML.parse( embedded_xml.text)
        model = which_model( doc)

        case doc.internal_subset.name
        # when 'contracts'
          # if doc.root.name == 'return'
          #   # Embedded XML within an embedded XML. Yuk.
          #   raise IssueCentre::AuthenticationError.new( doc.text)
          # end

        when 'generateKey'
          model_options = options.merge({ session_key: doc.text})
          model.create( model_options)
          return response

        else                    
          # i.e. when something else..          
          if doc.root.name == 'return'
            # Embedded XML within an embedded XML. Yuk.
            raise IssueCentre::AuthenticationError.new( doc.text)
          end
        end

        obj = recurse_and_build_model( doc, model.new)
        obj.save unless obj.attributes.empty?

        return response
      end

      # Traverse through the namespace tree, building the object(s)
      # along the way
      #
      # @param [Nokogiri::XML] fragment Fragment of the XML tree
      # @param [Hash] options obj Object to be built and saved
      # 
      # @return [Object] The last built object which may require saving
      #
      def recurse_and_build_model( fragment, obj)
        fragment.elements.each do |element|
          obj = recurse_and_build_model( element, obj)
        end
        fragment.attribute_nodes.each do |attr|
          case attr.name
          when 'defaultContract'
            obj[ :id] = attr.value.to_i
            obj[ :default_contract] = true
            obj[ :name] = 'defaultContract'
          when 'company'
            obj[ :company_name] = attr.value
          when 'country'
            obj[ :country_id] = attr.value
          when 'isDefault'
            obj[ :is_default] = attr.value == "1"
          when 'ticketCount'
            # skip (we don't need summaries)
          else
            obj[ attr.name.underscore.to_sym] = attr.value
          end
        end
        if fragment.attribute_nodes.empty? && fragment.elements.empty?
          # We're now close to the leaves themselves
          fragment.children.each do |child|
            if child.text?
              case fragment.name
              when 'date', 'dateclosed'
                obj[ fragment.name.underscore.to_sym] =
                  Time.at( child.text.to_i / 1000)
              else
                obj[ fragment.name.underscore.to_sym] = child.text
              end
            end
          end
        end
        if fragment.name == obj.class.to_s.demodulize.downcase
          obj.save unless obj.attributes.empty?
          obj = obj.class.new
        end
        return obj
      end
      

      # Returns the IssueCentre class corresponding to the supplied
      # Nokogiri::XML document.
      #
      # @param [Nokogiri::XML] doc Nokogiri document of the XML tree
      # 
      # @return [Class] The full IssueCentre class name for this XML object.
      #
      def which_model( doc)
        # Convert pluralised string into model name,
        # e.g. "contracts" => "Contract"
        model_name = doc.root.internal_subset.name.classify

        if model_name == 'GenerateKey'
          model_name = 'SessionKey'
        end
        
        # Convert name into object, ex. "Contract" => IssueCentre.Contract model
        IssueCentre.const_get( model_name)
      end

    end
  end
end
