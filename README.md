# IssueCentre

This library is designed to help Ruby/Rails based applications
communicate with the publicly available API for IssueCentre, as
provided by First Option Software ({http://www.bespokesoftware.com/}).


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
auth_client = IssueCentre::AuthConnection.new( <IssueCentre Auth URL>)


```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/issue_centre/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
