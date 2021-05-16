class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

portfolio = Portfolio.new
portfolio.add_account(Account.new('Bonds', 200))
portfolio.add_account(Account.new('Stocks', 100))
portfolio.add_account(Account.new('Real Estate', 1000))

portfolio.any? { |account| account.balance > 2000 }
portfolio.all? { |account| account.balance >= 10 }
portfolio.each { |account| puts "#{account.name}: #{account.balance}" }
portfolio.map { |account| account.balance }
portfolio.max
portfolio.min
