module Stalkable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end
end

class SomeRandomPerson
  include Stalkable

  attr_reader :name, :salary, :title

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

class TaxMan
  def update(person)
    puts "Send #{person.name} a new bill!!!"
  end
end

class LoanShark
  def update(person)
    puts "Send #{person.name} a freandly message :) "
  end
end

me = SomeRandomPerson.new('Poorman', 'Dev', 1000)
tax_man = TaxMan.new
loan_shark = LoanShark.new

me.add_observer(tax_man)
me.add_observer(loan_shark)

me.salary = 2000

