require 'securerandom'
require_relative './bank'

class Account
  attr_accessor :uuid, :name, :money, :bank

  def initialize(name, money, bank)
    @uuid = SecureRandom.uuid
    @name = name
    @money = money
    @bank = bank
  end
end
