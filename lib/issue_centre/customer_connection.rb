module IssueCentre
  class CustomerConnection < GenericConnection

    # Connection client for authenticating and retrieving customer
    # information from IssueCentre
    #
    # @param [String] customer_url IssueCentre endpoint url
    #   (e.g. {https://support.callclosed.net/issuecentre/Customer})
    # @param [String] session_key SessionKey for this session
    # @param [Hash] options Other options to pass to the constructors
    #
    # @return [CustomerConnection] Instance of CustomerConnection client
    #
    def initialize( customer_url, session_key, options = {})
      # @session_key = session_key
      super( customer_url, options)
    end


    # Return companies from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey for this session
    #
    # @param [String] wildcard The wildcard used to match the company
    #   names.  E.g. 'a*', 'Brit?sh'.  The wildcard is case
    #   insensitive. An empty string will return all companies.
    #
    # @return [Array] An array of companies and details as hashes
    #    
    def get_companies( session_key, wildcard = '')
      response_xml = self.call( :get_companies, message: {
                                  arg0: session_key,
                                  arg1: wildcard
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

    
    # Return contacts from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey for this session
    #
    # @param [Integer] company_id The numeric ID of the company for
    #   which to return contacts for.  Defaults to returning all
    #   contacts for all companies.
    #
    # @param [String] wildcard The wildcard used to match the contact
    #   names.  E.g. 'Ala?', 'Jas*'.  The wildcard is case
    #   insensitive. An empty string will return all contacts.
    #
    # @return [Array] An array of contacts and details as hashes
    #    
    def get_contacts( session_key, company_id = 0, wildcard = '')
      response_xml = self.call( :get_contacts, message: {
                                  arg0: session_key,
                                  arg1: company_id,
                                  arg2: wildcard
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

    
    # Return countries from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey for this session
    #
    # @return [Array] An array of countries and details as hashes
    #    
    def get_countries( session_key)
      response_xml = self.call( :get_countries, message: {
                                  arg0: session_key,
                                  arg1: ''
                                })
      response = IssueCentre::Response.parse( response_xml)
    end
  end
end
