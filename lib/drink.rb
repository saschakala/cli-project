class Drink

    @@all = []

    attr_accessor :name, :milk

    def initialize (name, milk = nil)
        @name = name
        @milk = milk
        @@all << self
    end


    def self.all
        @@all 
        # = ["Espresso", "Flat White", "Latte", "Americano"]
    end

    espresso = Drink.new("Espresso")
    flat_white = Drink.new("Flat White")



end

