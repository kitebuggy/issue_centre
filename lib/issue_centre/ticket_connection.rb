module IssueCentre
  class TicketConnection < GenericConnection

    # Connection client for authenticating and retrieving ticket
    # information from IssueCentre
    #
    # @param [String] endpoint_url IssueCentre endpoint url (e.g.
    #   {https://support.callclosed.net/issuecentre/Customer})
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


    # Return (open) tickets from IssueCentre for this contract
    #
    # @param [String] session_key SessionKey for this session
    #
    # @param [Integer] company_id A Company ID for the function to
    #   return open tickets for.  Zero returns a list of all open
    #   tickets across all companies.
    #
    # @param [Integer] page_size The number of tickets to be returned per page.
    #
    # @param [Integer] page_num Which page number [1+] to return tickets for.
    #
    # @return [Array] An array of open tickets and details as hashes
    #    
    def get_open_tickets( session_key, company_id, page_size, page_num)
      response_xml = self.call( :get_open_tickets, message: {
                                  arg0: session_key,
                                  arg1: company_id,
                                  arg2: page_size,
                                  arg3: page_num
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return (closed) tickets from IssueCentre for this contract
    #
    # @param [SessionKey] session SessionKey object
    #
    # @param [Integer] company_id A Company ID for the function to
    #   return closed tickets for.  Zero returns a list of all closed
    #   tickets across all companies.
    #
    # @param [Integer] page_size The number of tickets to be returned per page.
    #
    # @param [Integer] page_num Which page number [1+] to return tickets for.
    #
    # @return [Array] An array of closed tickets and details as hashes
    #    
    def get_closed_tickets( session_key, company_id, page_size, page_num)
      response_xml = self.call( :get_closed_tickets, message: {
                                  arg0: session_key,
                                  arg1: company_id,
                                  arg2: page_size,
                                  arg3: page_num
                                })
      response = IssueCentre::Response.parse( response_xml)
    end


    # Return all events from IssueCentre for this ticket
    #
    # @param [String] session SessionKey object
    #
    # @param [Integer] ticket Ticket ID for the required ticket
    #
    # @return [Array] An array of events and details as hashes
    #    
    def get_events_for_ticket( session_key, ticket_id)
      response_xml = self.call( :get_events_for_ticket, message: {
                                  arg0: session_key,
                                  arg1: ticket_id
                                })
      response = IssueCentre::Response.parse( response_xml)
    end



    # TODO:
    # :get_all_tags, :get_attachment, 
    # :get_recently_updated_tickets, :get_ticket_details,
    # :get_ticket_fix_group, :search_tickets,
  end    
end
