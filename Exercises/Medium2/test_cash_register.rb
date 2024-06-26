require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < Minitest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
  end

  def test_accept_money
    @transaction.amount_paid = 100
    previous_amount = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    assert_equal(previous_amount + 100, @cash_register.total_money)
  end

  def test_change
    @transaction.amount_paid = 200
    @cash_register.accept_money(@transaction)
    assert_equal(100, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $100.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end
end
