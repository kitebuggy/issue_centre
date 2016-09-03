module IssueCentre
  class ContractConnection < GenericConnection

    # Connection client for authenticating and retrieving contract
    # information from IssueCentre
    #
    # @param [String] customer_url IssueCentre endpoint url (e.g.
    #   {https://support.callclosed.net/issuecentre/Contract})
    #
    # @param [String] session_key SessionKey for this session
    #
    # @param [Hash] options Other options to pass to the constructors
    #
    # @return [CustomerConnection] Instance of CustomerConnection client
    #
    def initialize( customer_url, session_key, options = {})
      #      @session_key = session_key
      super( customer_url, options)
    end


    # Return all agents from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @param [Integer] agent_id Agent ID for the contract (0 returns all)
    #
    # @return [Array] An array of events and details as hashes
    #    
    def get_agents( session_key, agent_id)
      response_xml = self.call( :get_agents, message: {
                                  arg0: session_key,
                                  arg1: agent_id
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all error types from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of error types and details as hashes
    #    
    def get_error_types( session_key)
      response_xml = self.call( :get_error_types, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all event types from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of events and details as hashes
    #    
    def get_event_types( session_key)
      response_xml = self.call( :get_event_types, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all priorities from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of priorities and details as hashes
    #    
    def get_priorities( session_key)
      response_xml = self.call( :get_error_types, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all products from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of products and details as hashes
    #    
    def get_products( session_key)
      response_xml = self.call( :get_products, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all vendors from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of vendors and details as hashes
    #    
    def get_vendors( session_key)
      response_xml = self.call( :get_vendors, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all status types from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of statuses and details as hashes
    #    
    def get_status_types( session_key)
      response_xml = self.call( :get_status_types, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all 'received by' methods from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of 'received by' methods and details as hashes
    #    
    def get_received_bymethods( session_key)
      response_xml = self.call( :get_received_bymethods, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return ticket summary details from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey object
    #
    # @return [Array] An array of summary details as hashes
    #    
    def get_summary_details( session_key)
      response_xml = self.call( :get_summary_details, message: {
                                  arg0: session_key
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

    # @todo Not implemented yet: create_contract, 

  end    
end

