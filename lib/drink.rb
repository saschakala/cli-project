class Drink

    @@all = []
    @@milk = []
    @@no_milk = []

    attr_accessor :name, :milk, :description, :ratio, :cup

    def initialize (name, milk = "", description, ratio, cup)
        # add url to initialize
        @name = name
        @milk = milk
        @description = description
        @ratio = ratio
        @cup = cup
        @@all << self
        @@milk << self if milk == "yes"
        @@no_milk << self if milk == "no"
    end


    def self.all
        @@all
    end


    def self.milk_drinks
        @@milk
    end


    def self.no_milk_drinks
        @@no_milk
    end



    # espresso = Drink.new("Espresso", false)
    # latte = Drink.new("Latte", true)
    # flat_white = Drink.new("Flat White", true)
    # espresso.description = "words etc"
    # latte.description = "more words"
    # flat_white.description = "yummy"
    # espresso.ratio = "words etc"
    # latte.ratio = "more words"
    # flat_white.ratio = "blah"
    # espresso.cup = "words etc"
    # latte.cup = "more words"
    # flat_white.cup = "blah"



end


 # def self.drinks_sorted
    #     self.all.sort_by {|drink| drink.name}
    # end

      # def self.sorted_drinks_list
    #     sorted_drinks = self.all.sort_by {|drink| drink.name}
    #     sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    # end

    # def self.milk_drink_list
    #     sorted_drinks = self.milk_drinks.sort_by {|drink| drink.name}
    #     sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    # end

    # def self.no_milk_drink_list
    #     sorted_drinks = self.no_milk_drinks.sort_by {|drink| drink.name}
    #     sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    # end

