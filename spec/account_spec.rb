require 'account'

RSpec.describe Account, "Account behaviour" do
  context "create an account" do
    it "without arguments it must not create a new one" do
      expect {Account.new}.to raise_error(ArgumentError)
    end

    it "with slug and name should create a bank" do
      name = "Juan Garrido Arcos"
      money = 310.56
      bank = Bank.new("bbva", "Banco BBVA")
      expect {Account.new(name, money, bank)}.to_not raise_error
    end
  end
end
