require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id, :find, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end


  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(poke_id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?;", poke_id).flatten
      Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], hp: pokemon_array[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end

end
