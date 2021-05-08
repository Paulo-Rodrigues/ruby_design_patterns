class FirewallRule
  def destination(destination)
    @destination = destination
    self
  end

  def source(source)
    @source = source
    self
  end

  def protocol(protocol = 'tcp')
    @protocol = protocol
    self
  end

  def enable #or build, as the pattern name :)

  end
end

fw = FirewallRule.new
fw
  .destination('google.com')
  .source('localhost')
  .protocol('tcp') #optional param
  .enable

# using tap
class FirewallRuleTap
  attr_accessor :destination, :source, :port
end

fw2 = FirewallRuleTap.new.tap do |fw|
  fw.destination = 'google.com'
  fw.source = 'localhost'
  fw.port = 'tcp'
end
