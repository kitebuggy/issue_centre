module IssueCentre
  class TicketConnection < GenericConnection

    # Connection client for authenticating and retrieving ticket
    # information from IssueCentre
    #
    # @param [String] endpoint_url IssueCentre endpoint url
    #   (e.g. {https://support.callclosed.net/issuecentre/Customer})
    # @param [SessionKey] session_key SessionKey object holding session keys
    # @param [Hash] options Other options to pass to the constructors
    #
    # @return [CustomerConnection] Instance of CustomerConnection client
    #
    def initialize( customer_url, session_key, options = {})
      @session_key = session_key
      super( customer_url, options)
    end

    # :get_all_tags, :get_attachment, :get_closed_tickets,
    # :get_events_for_ticket, :get_open_tickets,
    # :get_recently_updated_tickets, :get_ticket_details,
    # :get_ticket_fix_group, :search_tickets,

    # Build (open) tickets from IssueCentre for this contract
    #
    # @param [SessionKey] session SessionKey object
    #
    # @param [Integer] company_id A Company ID for the function to
    # return open tickets for.  Zero returns a list of all open
    # tickets across all companies.
    #
    # @param [Integer] page_size The number of tickets to be returned per page.
    #
    # @param [Integer] page_num Which page number [1+] to return tickets for.
    #
    # @return [Response] A Response object
    #    
    def get_open_tickets( session, company_id, page_size, page_num)
      response_xml = self.call( :get_open_tickets, message: {
                                  arg0: session.session_key,
                                  arg1: company_id,
                                  arg2: page_size,
                                  arg3: page_num
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

    # Build (closed) tickets from IssueCentre for this contract
    #
    # @param [SessionKey] session SessionKey object
    #
    # @param [Integer] company_id A Company ID for the function to
    # return closed tickets for.  Zero returns a list of all closed
    # tickets across all companies.
    #
    # @param [Integer] page_size The number of tickets to be returned per page.
    #
    # @param [Integer] page_num Which page number [1+] to return tickets for.
    #
    # @return [Response] A Response object
    #    
    def get_closed_tickets( session, company_id, page_size, page_num)
      response_xml = self.call( :get_closed_tickets, message: {
                                  arg0: session.session_key,
                                  arg1: company_id,
                                  arg2: page_size,
                                  arg3: page_num
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

  end    
end
