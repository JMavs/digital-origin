require 'securerandom'

class Interbank
  attr_accessor :account_1, :account_2, :ammount, :success
  PERCENT_FAILURE = 30
  MAX_MONEY = 1000
  MONEY_COMMISION = 5

  def initialize(ac1, ac2, ammount)
    @account_1 = ac1
    @account_2 = ac2
    @ammount = ammount
    @success = nil
  end

  def valid?
    required_money = @ammount + MONEY_COMMISION

    (@account_1.bank != @account_2.bank) &&
      (@account_1.money - required_money) >= 0 &&
      SecureRandom.random_number(100) > PERCENT_FAILURE &&
      @ammount <= MAX_MONEY
  end

  def success!
    @success = true
  end

  def failed!
    @success = false
  end
end
