class User
  attr_reader :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end
end

class BasicFileGenerator
  attr_reader :user, :file_name

  def initialize(user, file_name)
    @user = user
    @file_name = file_name
  end

  def generate
    File.write(file_name, content)
  end

  private

  def header
    "---#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}---"
  end

  def body
    raise NotImplementedError
  end

  def footer
    '-------------'
  end

  def content
    [header, body, footer].join('\n')
  end
end

class FroogleFileGenerator < BasicFileGenerator
  private

  def body
    [user.first_name, user.last_name, user.email].join('|')
  end
end

class GamazonFileGenerator < BasicFileGenerator
  private

  def body
    ["#{user.first_name} #{user.last_name}", user.email].join(',')
  end
end
