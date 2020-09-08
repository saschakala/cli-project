class Drink

    @@all = []
    @@milk = []
    @@no_milk = []

    attr_accessor :name, :milk

    def initialize (name, milk = nil)
        @name = name
        @milk = milk
        @@all << self
        @@milk << self if milk == true
        @@no_milk << self if milk == false
        # if @milk == true
        #     @@milk << self
        # else @milk == false 
        #     @@no_milk << self
        # end
    end


    def self.all
        @@all 
        # = ["Espresso", "Flat White", "Latte", "Americano"]
    end


    def self.milk_drinks
        @@milk
    end


    def self.no_milk_drinks
        @@no_milk
    end


    def self.sorted_drinks_list
        sorted_drinks = self.all.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end

    def self.milk_drink_list
        sorted_drinks = self.milk_drinks.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end

    def self.no_milk_drink_list
        sorted_drinks = self.no_milk_drinks.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end

    


    



    espresso = Drink.new("Espresso", false)
    latte = Drink.new("Latte", true)
    flat_white = Drink.new("Flat White", true)



end


 # def self.drinks_sorted
    #     self.all.sort_by {|drink| drink.name}
    # end

