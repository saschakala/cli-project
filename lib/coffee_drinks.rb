class CoffeeDrinks

    def call
        greeting
        menu_1
        # list_drinks
        # milk_drinks
        # no_milk_drinks
    end

    def greeting
        puts "Hello! And welcome to the Bevvie Bevy: an interactive experience for coffee connoisseurs and novices alike.\n\nHave you ever wondered what the difference is between a flat white and long black? If so, the Bevy is here to help."
    end

    def menu_1
        puts "\nType 'list' to see a list of espresso beverages.\n\n** alternatively, for the lactose challenged among us, type 'milk' or 'no milk' to see drinks that both will and won't give you the poops **\n\n --> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--"
        input = gets.chomp
        if input == "list"
            list_drinks
            menu_details
        elsif input == "milk"
            milk_drinks
            menu_milk
        elsif input == "no milk"
            no_milk_drinks
            menu_no_milk
        elsif input == "exit"
            puts "A cuppa a day keeps the doctor away."
        else 
            puts "Looks like you need a boost of caffeine! Give it another go, we didn't quite catch that."
        end
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

    def menu_details
        puts "\nWhat's in a name? A drink by any other name would taste as sweet.\n\nTo learn more about a specific beverage enter its corresponding number below or type 'exit' to leave."

    end

    def menu_milk
        puts "\nLiving a life of lactose luxury, I see.\nSelect a number to learn more about your favorite drink's fuel to foam ratio."
    end

    def menu_no_milk
        puts "\nFunfact: approximately 65% of the human population has a reduced ability to digest lactose after infancy. You are not alone.\nSelect a number to learn more about your favorite drink."
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