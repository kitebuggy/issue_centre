module IssueCentre
  class Response
    
    class << self
      
      # Parse the response retrieved during any request.
      #
      # @param [XML] savon_response Savon's representation of the response
      #
      # @param [Hash] options Any default attributes that should be
      #   added to the model
      # 
      # @return [Array] Array of hashes with combined response details
      #
      def parse( savon_response, options = {})

        # retrieve the embedded xml
        embedded_xml = savon_response.xpath( '//return')
      
        # check for responses we don't understand
        if embedded_xml.blank?
          raise IssueCentre::ParseError.new( savon_response.body.keys.first)
        end

        # parse the embbeded xml
        doc = Nokogiri::XML.parse( embedded_xml.text)
        model_name = which_model( doc)
        
        case doc.internal_subset.name
        when 'generateKey'
          # special case for session keys
          return doc.text
        else                    
          if doc.root.name == 'return'
            # Embedded XML within an embedded XML. Yuk.
            raise IssueCentre::AuthenticationError.new( doc.text)
          end
        end

        arr, obj = [], {}
        arr, obj = recurse_and_build_model( doc, model_name, arr, obj)
        arr << obj unless obj.empty?
        return arr
      end

      
      # Traverse through the namespace tree, building the object(s)
      # along the way
      #
      # @param [Nokogiri::XML] fragment Fragment of the XML tree
      # @param [String] model_name IssueCentre model being built
      # @param [Array] arr Array of object hashes built so far
      # @param [Hash] obj Object to be built (or being built)
      # 
      # @return [Array] Array of hashes representing the XML objects
      # @return [Hash] Hash representing the last object being built (which
      #   may be empty)
      #
      def recurse_and_build_model( fragment, model_name, arr, obj)
        fragment.elements.each do |element|
          arr, obj = recurse_and_build_model( element, model_name, arr, obj)
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
          when 'ticketCount', 'changeType', 'supportType'
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
        if fragment.name == model_name
          arr << obj unless obj.empty?
          obj = {}
        end
        return arr, obj
      end

      private

      # Returns the model name corresponding to the supplied
      # Nokogiri::XML document.
      #
      # @param [Nokogiri::XML] doc Nokogiri document of the XML tree
      # 
      # @return [String] The IssueCentre model name for this XML object.
      #
      def which_model( doc)
        # Convert pluralised string into model name,
        # e.g. "contracts" => "Contract"
        model_name = doc.root.internal_subset.name.classify

        if model_name == 'GenerateKey'
          model_name = 'SessionKey'
        end

        model_name.downcase
      end
    end
  end
end
