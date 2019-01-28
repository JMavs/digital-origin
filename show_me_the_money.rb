require_relative './lib/bank'
require_relative './lib/account'
require_relative './lib/transfer_agent'

bank_a = Bank.new("bank-a", "Bank A")
bank_b = Bank.new("bank-b", "Bank B")

jim = Account.new("Jim", 30000.0, bank_a)
emma = Account.new("Emma", 0.0, bank_b)

puts "#{jim.name} has initial money #{jim.money}"
puts "#{emma.name} has initial money #{emma.money}"
puts "--------------------------------------------"

ta = TransferAgent.new

while emma.money != 20000.0 do
  ta.perform(jim, emma, 1000.0)
end

puts "#{jim.name} has final money #{jim.money}"
puts "#{emma.name} has final money #{emma.money}"
puts "--------------------------------------------"
puts "#{bank_a.name} has the movements:"
puts bank_a.transfers
puts "#{bank_b.name} has the movements:"
puts bank_b.transfers
