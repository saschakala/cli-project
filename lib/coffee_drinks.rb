class CoffeeDrinks

    def call
        greeting
        puts "\nType 'list' to see a list of espresso beverages.\n\n** alternatively, for the lactose challenged, type 'milk' or 'no milk' to see drinks that both will and won't give you indigestion **\n\n --> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--"
        menu_1
        # list_drinks
        # milk_drinks
        # no_milk_drinks
    end

    def greeting
        puts "Hello! And welcome to the Bevvie Bevy: an interactive experience for coffee connoisseurs and novices alike.\n\nHave you ever wondered what the difference is between a flat white and long black? If so, the Bevy is here to help."
    end

    def menu_1
        input = gets.chomp.downcase
        if input == "list"
            list_drinks
            puts "\nWhat's in a name? A drink by any other name would taste as sweet.\n\nTo learn more about a specific beverage enter its corresponding number below or type 'exit' to leave."
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
            puts "\n--> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--"
            menu_1
        end
    end

    def menu_details
        input = gets.chomp.downcase
        if input == "exit"
            puts "I know, I know: our latte art needs work."
        elsif !input.to_i.between?(1, Drink.all.count)
            list_drinks
            puts "\nLooks like that drink doesn't exist yet! Try again, captain."
            puts "\nSelect a number to get drink details or type 'exit' to leave."
            menu_details 
            #put the list_drinks and menu again but only after 5 seconds - look this up
        else
            # using the input as the index to access the value of that hash (the details of the drink)
            drink = Drink.all[input.to_i-1]
            drink_details(drink)
        end
    end

    def menu_milk
        puts "\nLiving a life of lactose luxury, I see.\nSelect a number to learn more about your favorite drink's fuel to foam ratio."
        input = gets.chomp.downcase
    end

    def menu_no_milk
        puts "\nFunfact: approximately 65% of the human population has a reduced ability to digest lactose after infancy. You are not alone.\nSelect a number to learn more about your favorite drink."
        input = gets.chomp.downcase
    end


    def list_drinks
        sorted_drinks = Drink.all.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end
    
    def milk_drinks
        sorted_drinks = Drink.milk_drinks.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end
    
    def no_milk_drinks
        sorted_drinks = Drink.no_milk_drinks.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end

    def drink_details (drink)
        # Scraper.scrape_drink_details(drink)
        puts "Order up! One #{drink.name}:"
        puts "#{drink.description}"
        puts "#{drink.ratio}"
        puts "#{drink.cup}"
        puts "#{drink.milk}"
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