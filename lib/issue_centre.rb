require 'bundler/setup'
require 'savon'
require 'active_hash'
require 'active_support'

$: << File.expand_path( File.dirname(__FILE__))

require 'issue_centre/version'
require 'issue_centre/exception'
require 'issue_centre/xml_examples'

require 'issue_centre/generic_connection'
require 'issue_centre/auth_connection'
require 'issue_centre/customer_connection'
require 'issue_centre/ticket_connection'
require 'issue_centre/response'

require 'issue_centre/models/contract'
require 'issue_centre/models/session_key'

require 'issue_centre/models/contact'
require 'issue_centre/models/company'
require 'issue_centre/models/country'

require 'issue_centre/models/ticket'
require 'issue_centre/models/event'


