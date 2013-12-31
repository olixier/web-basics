$albums = []

class Album
  
  attr_reader :name, :artist, :year
  
  def initialize(args = {})
    @name = args[:name]
    @artist = args[:artist]
    @year = args[:year]
  end
  
  def save
    $albums << self
  end
  
  def self.find(id)
    $albums[id]
  end
  
  def update(args = {})
    @name = args[:name]
    @artist = args[:artist]
    @year = args[:year]
  end
  
  def delete
    $albums.delete(self)
  end
  
  def to_s
    "#{@name} (#{@year}) by #{@artist}"
  end
    
end
