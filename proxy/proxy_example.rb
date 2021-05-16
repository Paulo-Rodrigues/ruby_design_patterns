require 'etc'

class Account
  attr_reader :balance

  def initialize(starting_balance=0)
    @balance = starting_balance
  end

  def depoist(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def deposit(amount)
    check_access
    @subject.depoist(amount)
  end

  def withdraw(amount)
    check_access
    @subject.withdraw(amount)
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise 'Ilegal access'
    end
  end
end

account = Account.new(100)
account.deposit(100)
account.withdraw(10)

proxy = AccountProtectionProxy.new(account, 'paulo')
proxy.deposit(50)
proxy.withdraw(20)
