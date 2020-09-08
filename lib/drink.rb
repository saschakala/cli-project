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


    def self.drinks_sorted
        self.all.sort_by {|drink| drink.name}
    end


    def self.list_sorted_drinks
        self.drinks_sorted.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end

    espresso = Drink.new("Espresso")
    latte = Drink.new("Latte")
    flat_white = Drink.new("Flat White")



end

