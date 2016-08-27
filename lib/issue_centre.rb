require 'bundler/setup'
require 'savon'
require 'active_support/core_ext/string/inflections'

$: << File.expand_path( File.dirname(__FILE__))

require 'issue_centre/version'
require 'issue_centre/exception'

require 'issue_centre/generic_connection'
require 'issue_centre/auth_connection'
require 'issue_centre/customer_connection'
require 'issue_centre/ticket_connection'
require 'issue_centre/response'

