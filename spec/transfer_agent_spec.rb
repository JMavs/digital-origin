require 'bank'
require 'account'
require 'transfer_agent'

RSpec.describe TransferAgent, "Transfer agent behaviour" do
  context "create a transfer agent" do
    it "creates a transfer agent" do
      expect {TransferAgent.new}.to_not raise_error
    end
  end

  context "do an intrabank transfer" do
    it "has enough money to move" do
      bank = Bank.new("bbva", "Banco BBVA")
      ac1 = Account.new("Juan", 300.0, bank)
      ac2 = Account.new("Pepe", 500.0, bank)
      ta = TransferAgent.new
      transfer = ta.perform(ac1, ac2, 200.0)

      expect(transfer.success).to be(true)
      expect(ac1.money).to eq(100.0)
      expect(ac2.money).to eq(700.0)
    end

    it "has not enough money to move" do
      bank = Bank.new("bbva", "Banco BBVA")
      ac1 = Account.new("Juan", 300.0, bank)
      ac2 = Account.new("Pepe", 500.0, bank)
      ta = TransferAgent.new
      transfer = ta.perform(ac1, ac2, 400.0)

      expect(transfer.success).to be(false)
      expect(ac1.money).to eq(300.0)
      expect(ac2.money).to eq(500.0)
    end
  end

  context "do an interbank transfer" do
    it "has enough money to move" do
      bank1 = Bank.new("bbva", "Banco BBVA")
      bank2 = Bank.new("caixa", "Banco CaixaBank")
      ac1 = Account.new("Juan", 300.0, bank1)
      ac2 = Account.new("Pepe", 500.0, bank2)
      ta = TransferAgent.new
      transfer = ta.perform(ac1, ac2, 200.0)

      if transfer.success
        expect(ac1.money).to eq(95.0)
        expect(ac2.money).to eq(700.0)
      else
        expect(ac1.money).to eq(300.0)
        expect(ac2.money).to eq(500.0)
      end
    end

    it "has not enough money to move" do
      bank1 = Bank.new("bbva", "Banco BBVA")
      bank2 = Bank.new("caixa", "Banco CaixaBank")
      ac1 = Account.new("Juan", 300.0, bank1)
      ac2 = Account.new("Pepe", 500.0, bank2)
      ta = TransferAgent.new
      transfer = ta.perform(ac1, ac2, 600.0)

      expect(transfer.success).to be(false)
      expect(ac1.money).to eq(300.0)
      expect(ac2.money).to eq(500.0)
    end

    it "overpass 1000 money movement" do
      bank1 = Bank.new("bbva", "Banco BBVA")
      bank2 = Bank.new("caixa", "Banco CaixaBank")
      ac1 = Account.new("Juan", 1300.0, bank1)
      ac2 = Account.new("Pepe", 500.0, bank2)
      ta = TransferAgent.new
      transfer = ta.perform(ac1, ac2, 1050.0)

      expect(transfer.success).to be(false)
      expect(ac1.money).to eq(1300.0)
      expect(ac2.money).to eq(500.0)
    end
  end
end
