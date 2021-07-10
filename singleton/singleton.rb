class Configuration
  @@instance = Configuration.new

  def self.instance
    @@instance
  end

  private_class_method :new
end

config = Configuration.instance
config = Configuration.instance


# config = Configuration.new throw an error
