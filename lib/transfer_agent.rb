require_relative './transfers/intrabank'
require_relative './transfers/interbank'

class TransferAgent
  def initialize; end

  def perform(ac1, ac2, ammount)
    if ac1.bank == ac2.bank
      ib = Intrabank.new(ac1, ac2, ammount)
    else
      ib = Interbank.new(ac1, ac2, ammount)
      ac2.bank.add_transfer(ib)
    end
    ac1.bank.add_transfer(ib)
    try_transfer(ib)
    return ib
  end

  private

  def try_transfer(transfer)
    if transfer.valid?
      transfer.account_1.money-=(transfer.ammount + transfer.class::MONEY_COMMISION)
      transfer.account_2.money+=transfer.ammount
      transfer.success!
    else
      transfer.failed!
    end
  end
end
