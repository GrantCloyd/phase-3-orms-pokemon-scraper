require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(attributes = {})
        # @id = id
        # @name = name
        # @type = type
        # @db = db
       
   attributes.each {|key, value| self.class.attr_accessor(key)} 
   attributes.each {|key, value| self.send(("#{key}="), value)}
    end
    
    def self.save(name, type, db) 
     sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
     db.execute(sql, name, type)
    end
     


    def self.find(id, db)
    sql = <<-SQL
        SELECT * 
        from pokemon 
        WHERE id = ?
         SQL
    id, name, type = db.execute(sql, id).flatten
    hash = {:id => id, :name => name, :type => type}

    self.new(hash)
    
    end

end
