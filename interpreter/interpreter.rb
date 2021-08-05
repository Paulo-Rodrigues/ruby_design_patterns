# Interpreter pattern example

class Interpreter
  def initialize(input)
    @input = input
  end

  def interpret
    @input.each do |line|
      puts line
    end
  end
end

if __FILE__ == $0
  input = ["Hello", "World", "!"]
  interpreter = Interpreter.new(input)
  interpreter.interpret
end