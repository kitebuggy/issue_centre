require './test/test_helper'

class IssueCentreConnectionGenerateKeyTest < Minitest::Test
  def test_exists
    assert IssueCentre::Connection::Key
  end
end
