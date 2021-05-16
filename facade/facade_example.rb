module Text
end

class Texty::Searcher
  def self.search(query)
    "searched #{query}"
  end
end

class Texty::Finder
  def self.find(phrase)
    "found #{phrase}"
  end
end

class Texty::Serializer
  def self.serialize(string)
    "serialized #{string}"
  end
end

class Texty::Facade
  def search(query)
    Texty::Searcher.search(query)
  end

  def find(phrase)
    Texty::Finder.find(phrase)
  end

  def serialize(string)
    Texty::Serializer.serialize(string)
  end
end

facade = Texty::Facade.new
facade.search('query')
facade.find('some phrase')
facade.serialize('some string')
