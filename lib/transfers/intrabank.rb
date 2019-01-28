class Intrabank
  attr_accessor :account_1, :account_2, :ammount, :success
  MONEY_COMMISION = 0

  def initialize(ac1, ac2, ammount)
    @account_1 = ac1
    @account_2 = ac2
    @ammount = ammount
    @success = nil
  end

  def valid?
    (@account_1.bank == @account_2.bank) &&
      (@account_1.money - @ammount) >= 0
  end

  def success!
    @success = true
  end

  def failed!
    @success = false
  end
end
