class User
  attr_reader :first_name, :last_name, :city

  def initialize(first_name, last_name, city)
    @first_name = first_name
    @last_name = last_name
    @city = city
  end
end

class DecoratedUser < SimpleDelegator
  def full_name
    "#{user.first_name} #{user.last_name}"
  end

  def greeting
    "Hi #{first_name} from #{city} city"
  end
end

user = User.new('Joe', 'Doe')
decorated_user = DecoratedUser.new(user)
decorated_user.full_name
decorated_user.greeting


