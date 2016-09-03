module IssueCentre
  class TicketConnection < GenericConnection

    # Connection client for authenticating and retrieving ticket
    # information from IssueCentre
    #
    # @param [String] customer_url IssueCentre endpoint url (e.g.
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
    # @param [SessionKey] session_key SessionKey object
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
    # @param [String] session_key SessionKey object
    #
    # @param [Integer] ticket_id Ticket ID for the required ticket
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



    # Return all details from IssueCentre for this ticket
    #
    # @param [String] session_key SessionKey object
    #
    # @param [Integer] ticket_id Ticket ID for the required ticket
    #
    # @return [Array] An array of details as hashes
    #    
    def get_ticket_details( session_key, ticket_id)
      response_xml = self.call( :get_ticket_details, message: {
                                  api_key: session_key,
                                  ticket: ticket_id
                                })
      response = IssueCentre::Response.parse( response_xml)
    end



    # Return all tickets from IssueCentre that match these search parameters
    #
    # @param session_key [String] SessionKey object
    #
    # @param [Integer] company_id Company ID to search for (0 returns
    #   tickets for all companies)
    #
    # @param [Integer] contact_id Contact ID to search for (0 returns
    #   tickets for all contacts)
    #
    # @param [Integer] vendor_id Vendor ID to search for (0 returns
    #   tickets for all vendors)
    #
    # @param [Integer] product_id Product ID to search for (0 returns
    #   tickets for all products)
    #
    # @param [Symbol] status Ticket status to search for (:open, :closed, :both)
    #
    # @param [String] ticket_reference Ticket reference to search for
    #   ("" returns tickets for all references)
    #
    # @param [Integer] owner_id Ticket Owner ID to limit search by
    #   (0 returns tickets for all references)
    #
    # @param [String] client_reference Client reference to search for
    #   ("" returns tickets for all references)
    #
    # @param [String] supplier_reference Ticket reference to search for
    #   ("" returns tickets for all references)
    #
    # @param [String] company_reference Ticket reference to search for
    #   ("" returns tickets for all references)
    #
    # @param [Time] date_from Date and time to search from (based on
    #   ticket creation date)
    #
    # @param [Time] date_to Date and time to search until (based on
    #   ticket creation date)
    #
    # @param [Integer] ticket_status The ticket status code to search for
    #   (0 returns all status codes)
    #
    # @param [Integer] priority The ticket priority code to search for
    #   (0 returns all priority codes)
    #
    # @param [String] free_text Text to search for within the tickets
    #
    # @param [Integer] page_size The number of tickets to be returned per page.
    #
    # @param [Integer] page_num Which page number [1+] to return tickets for.
    #
    # @param [String] tags Which tags to limit the search to
    #
    # @return [Array] An array of tickets and details as hashes
    #    
    def search_tickets( session_key, company_id, contact_id,
                        vendor_id, product_id, status, owner_id,
                        ticket_reference, client_reference,
                        supplier_reference, company_reference,
                        date_from, date_to, ticket_status, priority, free_text,
                        page_size, page_num, tags)

      response_xml = self.call( :search_tickets, message: {
                                  arg0:  session_key,
                                  arg1:  company_id,
                                  arg2:  contact_id,
                                  arg3:  vendor_id,
                                  arg4:  product_id,
                                  arg5:  status,
                                  arg6:  owner_id,
                                  arg7:  ticket_reference,
                                  arg8:  client_reference,
                                  arg9:  supplier_reference,
                                  arg10: company_reference,
                                  arg11: date_from,
                                  arg12: date_to,
                                  arg13: ticket_status,
                                  arg14: priority,
                                  arg15: free_text,
                                  arg16: page_size,
                                  arg17: page_num,
                                  arg18: tags
                                })
      response = IssueCentre::Response.parse( response_xml)
    end

    # @todo Not implemented yet: add_event_to_ticket,
    # add_reminder_to_ticket, create_ticket, get_all_tags,
    # get_attachment, get_recently_updated_tickets,
    # get_ticket_fix_group, send_email_response_from_ticket,
    # set_ticket_fix_group, toggle_notification_for_ticket,
    # update_custom_field_value, upload_encoded_file_to_ticket,
    # upload_file_to_ticket

  end    
end

