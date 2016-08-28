module IssueCentre
  class AuthConnection < GenericConnection

    # Connection client for authenticating and retrieving contracts
    # from IssueCentre
    #
    # @param [String] endpoint_url IssueCentre endpoint url
    #   (e.g. {https://support.callclosed.net/issuecentre/Connection})
    # @param [Hash] options Other options to pass to the constructors
    #
    # @return [AuthConnection] Instance of AuthConnection client
    #
    def initialize( auth_url, options = {})
      super( auth_url, options)
    end

    # Obtain possible contracts from IssueCentre for this user
    #
    # @param [String] username A valid user in IssueCentre
    # @param [String] password A valid password in IssueCentre
    #
    # @return [Array] A array of valid contract hashes, one of which
    #   may be marked as the default contract.
    #    
    def get_contracts( username, password)
      response_xml = self.call( :get_contracts, message: {
                                  arg0: username,
                                  arg1: password
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

    
    # Generate a contract-specific session key for this user from IssueCentre
    #
    # @param [String] username A valid user in IssueCentre
    # @param [String] password A valid password in IssueCentre
    # @param [String] contract A valid contract for this user
    #
    # @return [Array] Nokogiri::XML::Element array of return values
    #    
    def generate_key( username, password, contract)
      response_xml = self.call( :generate_key, message: {
                                  arg0: username,
                                  arg1: password,
                                  arg2: contract
                                })
      response = IssueCentre::Response.parse( response_xml,
                                              {contract_id: contract})
    end
  end
end
