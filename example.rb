require_relative 'lib/issue_centre'

c = IssueCentre::AuthConnection.new( "https://support.callclosed.net/issuecentre/Connection")
r = c.get_contracts( "jasonh", "l:3Kq]R3js@M")
r = c.generate_key( "jasonh", "l:3Kq]R3js@M", IssueCentre::Contract.default.id)

c = IssueCentre::CustomerConnection.new( "https://support.callclosed.net/issuecentre/Customer", IssueCentre::SessionKey.first)

r = c.get_companies
# r = c.get_contacts
# r = c.get_countries

c = IssueCentre::TicketConnection.new( "https://support.callclosed.net/issuecentre/Ticket", IssueCentre::SessionKey.first)

#r = c.get_open_tickets( IssueCentre::SessionKey.first, IssueCentre::Company.first.id, 100, 1)
r = c.get_closed_tickets( IssueCentre::SessionKey.first, IssueCentre::Company.first.id, 100, 1)

# r = c.get_events
