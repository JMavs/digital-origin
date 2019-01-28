require 'bank'

RSpec.describe Bank, "Bank behaviour" do
  context "create a bank" do
    it "without arguments it must not create a new one" do
      expect {Bank.new}.to raise_error(ArgumentError)
    end

    it "with slug and name should create a bank" do
      slug = "bbva"
      name = "Banco BBVA"
      expect {Bank.new(slug, name)}.to_not raise_error
    end
  end
end
