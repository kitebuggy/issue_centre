require './test/test_helper'

class IssueCentreConnectionTest < Minitest::Test
  def test_exists
    assert IssueCentre::Connection
  end
end
