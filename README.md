# Digital Origin

## Objetives
- Object Oriented Programming
- TDD
- Clean code
- Git
- Problem solving

## Instructions
- Create a project which models the situation below
- The language used is Ruby
- All the code should be tested following TDD
- A README file must be attached explaining my implementation
- Create a .zip with your code and git directory
- Answer our email with the zip project

## Background
The software you write in this test will be used for banks. Banks have accounts.
Accounts hold money. Transfers can be made between accounts. Banks store the
history of transfers.
There can be two types of transfers:
- Intra-bank transfers, between accounts of the same bank. They don't
have commissions, they don't have limits and they always succeed.
- Inter-bank transfers, between accounts of different banks. They have 5€
commissions, they have a limit of 1000€ per transfer. And they have a 30%
chance of failure.

## Part 1
Create the models and their relationships to accurately reflect banks, accounts
and transfers. Make sure that new types of accounts and transfers can be added
to the bank with minimal effort.

## Part 2
After modeling the domain(part 1), create a file called
show_me_the_money.rb in charge of reproducing the next situation:
Jim has an account on the bank A and Emma has an account on the bank B. Jim
owes Emma 20000€. Emma is already a bit angry, because she did not get the
money although Jim told her that he already sent it.
Help Jim send his money by developing a transfer agent. This agent assures
that everybody gets their money. When the agent receives an order to transfer
money from account A to account B, he issues transfers considering commissions,
transfer limits and possibility of transfer failures.

The execution of the script will print the balance of every account before and after
the transfers and the history of the transfer of every bank.

## Questions
Please also supply your answer to the following questions:
- How would you improve your solution?
I would improve it adding a new folder inside the `lib` folder
containing the errors, doing this it can show errors like NoEnoughMoney
or LimitMoneyInterbankReached.

Another change would be checking (just in order to be sure, check the
uuid if are free, slugs of banks and everything related to data).

If I had used ActiveRecord (the ORM of RoR) I would have done the change
with a transaction because if it fails in the exact part of the code
broke (Maybe CTRL+C), it can subtract the money in the account 1 but not
add it in the account 2, so it will be a HUGE problem inside the
ccurrencies' world.


- How would you adapt your solution if transfers are not instantaneous?
I would do an intermediate holder in order to be sure that as fast as it
can be done, the process follows (get money from account 1 to holder ->
holder move the money to account 2) in order to not lose the avoid
cancels in orders an send money to the account 2 by error (because the
bank of account 1 is slower to make operations for example).


## My solution
I divided my solution in this steps:
- 1: In order to use the TDD, I wrote the minimal tests and added the suite
CircleCI.
- 2: Write the minimal code to pass that tests.
- 3: Develop the tests with more functionality (increase the code using
  SOLID principles in order to avoid useless commits).
- 4: Add the code in order to pass all the tests.
- 5: The tests an code are working, now it's time to write the
  "show_me_the_money.rb"
- 6: Run the script."

## Install dependencies
- Use Ruby 2.5.3
- `gem install bundler`
- `bundle install`

## How to test
- `rspec`

## How to run the script
- `ruby show_me_the_money.rb`
