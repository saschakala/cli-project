class CoffeeDrinks

    def call
        greeting
        list_drinks
        milk_drinks
        no_milk_drinks
        menu
    end

    def greeting
        puts "Hello!\nWelcome to the Bevvie Bevy:\nan interactive experience for coffee connoisseurs and novices alike.\n\nHave you ever wondered what, exactly, the difference is between a flat white and long black? If so, the Bevy is here to help.\n\nType 'list' to see a list of espresso beverages.\n\n** alternatively, for the lactose challenged among us, type 'milk' or 'no milk' to see drinks that both will and won't give you the poops **\n\n --> enter 'list', 'milk', or 'no milk' to proceed and 'exit' to leave <--"
    end

    def list_drinks
        Drink.sorted_drinks_list
    end

    def milk_drinks
        Drink.milk_drink_list 
    end

    def no_milk_drinks
        Drink.no_milk_drink_list
    end


    def menu
        puts "\nWhat's in a name? A drink by any other name would taste as sweet.\n\nTo learn more about a beverage, enter its corresponding list number below or type 'exit' to leave."

    end





end


 # def greeting
    #     puts <<-DOC
    #     Hello!
    #     Welcome to the Bevvie Bevy:
    #     an interactive experience for coffee connoisseurs and novices alike.
        
    #     Have you ever wondered what, exactly, the difference is between a flat white and long black? If so, the Bevy is here to help.
        
    #     Type 'list' to see a list of espresso beverages.
        
    #     ** alternatively, for the lactose challenged among us, type 'milk' or 'no milk' to see drinks that both will and won't give you indigestion **
        
    #     --> enter 'list', 'milk', or 'no milk' to proceed and 'exit' to leave (womp womp) <--
    #     DOC

    # end