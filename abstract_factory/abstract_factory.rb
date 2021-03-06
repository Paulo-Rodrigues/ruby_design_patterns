class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat; end

  def speak; end

  def sleep; end
end

class Tiger < Animal
  def eat
    puts "Tiger #{name} is eating"
  end

  def speak
    puts "Tiger #{name} Roars"
  end

  def sleep
    puts "Tiger #{name} sleeping"
  end
end

class Plant
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def grow
  end
end

class Tree < Plant
  def grow
    puts "Tree #{name} growing"
  end
end

class Habitat
  def initialize(organism_factory, number_animals: 0, number_plants: 0)
    @organism_factory = organism_factory
    @animals = []
    number_animals.times do |i|
      animal = @organism_factory.new_animal("Animal#{i}")
      @animal << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = @organism_factory.new_plant("Plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each { |plant| plant.grow }
    @animals.each { |animal| animal.speak }
    @animals.each { |animal| animal.eat }
    @animals.each { |animal| animal.sleep }
  end
end

class JungleOrganismFactory
  def new_animal(name)
    Tiger.new(name)
  end

  def new_plant(name)
    Tree.new(name)
  end
end

jungle = Habitat.new(JungleOrganismFactory.new, number_animals: 1, number_plants: 4)
jungle.simulate_one_day
