class TrafficLight
  def initialize
    @state = nil
  end

  def next_state(klass=Green)
    @state = klass.new(self)

    @state.beep
    @state.start_timer
  end
end

class State
  def initialize(light)
    @light = light
  end
end

class Green < State
  def beep
    puts 'Color is now green'
  end

  def next_state
    @light.next_state(Yellow)
  end

  def start_timer
    sleep 3; next_state
  end
end

class Yellow < State
  def beep
    puts 'color is now yellow'
  end

  def next_state
    @light.next_state(Red)
  end

  def start_timer
    sleep 3; next_state
  end
end

class Red < State
  def beep
    puts 'color is now Red'
  end

  def next_state
    @light.next_state(Green)
  end

  def start_timer
    sleep 3; next_state
  end
end

t = TrafficLight.new
t.next_state
