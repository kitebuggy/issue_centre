require './test/test_helper'

class IssueCentreConnectionGetContractsTest < Minitest::Test
  def test_exists
    assert IssueCentre::Connection::Contracts
  end
end
