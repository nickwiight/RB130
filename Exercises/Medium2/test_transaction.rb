require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TestTransaction < Minitest::Test
  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    input = StringIO.new("200\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(200, @transaction.amount_paid)
  end
end
