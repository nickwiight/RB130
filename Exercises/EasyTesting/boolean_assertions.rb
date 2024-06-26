require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Test < Minitest::Test
  def test_boolean
    value = 0
    assert value.odd?, 'value is not odd'
  end
end
