# IssueCentre

This library is designed to help Ruby/Rails based applications
communicate with the publicly available API for IssueCentre, as
provided by First Option Software (http://www.bespokesoftware.com/).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'issue_centre'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install issue_centre

## Usage

Basic usage:

```ruby
require 'rubygems'
require 'issue_centre'

# Create an authentication client connection to authenticate session
auth_conn = IssueCentre::AuthConnection.new( "<IssueCentre Auth URL>")

# Collect all applicable contracts
contracts = auth_conn.get_contracts( "<username>", "<password>")


# Obtain a session key for a relevant contract
session_key = auth_conn.generate_key( "<username>", "<password>", contracts.last[:id])

# Create a customer connection (note this is usually a different URL)
cust_conn = IssueCentre::CustomerConnection.new( "<IssueCentre Customer URL>"), session_key)

# Grab a list of all companies (you can also search with a wildcard)
companies = cust_conn.get_companies( session_key)

# or using a wildcard to find companies beginning with "British"...
companies = cust_conn.get_companies( session_key, "British*")

# Grab a list of all contacts (you can also search with a wildcard)
contacts = cust_conn.get_contacts( session_key)

# Grab a list of all countries
countries = cust_conn.get_countries( session_key)

# Create a ticket connection (note this is usually a different URL)
ticket_conn = IssueCentre::TicketConnection.new( "<IssueCentre Ticket URL>", session_key)

# Grab a list of open tickets for the specified company
open_tickets = ticket_conn.get_open_tickets( session_key, companies.first[:id], 100, 1)

# Grab a list of closed tickets for the specified company
closed_tickets = ticket_conn.get_closed_tickets( session_key, companies.first[:id], 100, 1)

```

## Contributing

1. Fork it ( https://github.com/kitebuggy/issue_centre/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
