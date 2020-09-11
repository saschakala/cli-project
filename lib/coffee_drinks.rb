class CoffeeDrinks

    def call
        greeting
        Scraper.scrape_drinks
        puts "\nType 'list' to see a list of espresso beverages.\n\n** alternatively, for the lactose challenged, type 'milk' or 'no milk' to see drinks that both will and won't give you indigestion **\n\n --> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--"
        menu_main
    end

    def greeting
        puts "Hello! And welcome to the Bevvie Bevy: an interactive experience for coffee connoisseurs and novices alike.\n\nHave you ever wondered what the difference is between a flat white and long black? If so, the Bevy is here to help."
    end

    def try_again_boost
        puts "Looks like you need a boost of caffeine! Give it another go, we didn't quite catch that."
    end

    def select_drink
        puts "\nSelect a number to get drink details or type 'exit' to leave."
    end

    def doesnt_exist
        puts "\nLooks like that drink doesn't exist yet! Try again, captain."
    end




    def menu_main
        input = gets.chomp.downcase
        if input == "list"
            list_drinks
            puts "\nWhat's in a name? A drink by any other name would taste as sweet."
            menu_details
        elsif input == "milk"
            milk_drinks
            puts "\nLiving a life of lactose luxury, I see."
            menu_milk
        elsif input == "no milk"
            no_milk_drinks
            puts "\nFunfact: approximately 65% of the human population has a reduced ability to digest lactose after infancy. You are not alone."
            menu_no_milk
        elsif input == "exit"
            puts "A cuppa a day keeps the doctor away."
        else 
            try_again_boost
            puts "\n--> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--"
            menu_main
        end
    end

    def menu_details
        puts "\nTo learn more about a specific beverage enter its corresponding number below or type 'exit' to leave."
        input = gets.chomp.downcase
        if input == "exit"
            puts "I know, I know: our latte art needs work."
        elsif !input.to_i.between?(1, Drink.all.count)
            list_drinks
            doesnt_exist
            select_drink
            menu_details 
        else
            drink = Drink.sorted_all[input.to_i-1]
            drink_details(drink)
            puts "\nWould you like to see another drink (y / n) or perhaps view brews by milk content? (milk / no milk)?"
            menu_details_second
        end
    end

    def menu_details_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "What do you call a sad cup of coffee? A depresso."
        elsif round_two == "milk"
            milk_drinks
            menu_milk
        elsif round_two == "no milk"
            no_milk_drinks
            menu_no_milk
        elsif round_two == "y"
            list_drinks
            select_drink
            menu_details
        else 
            try_again_boost
            puts "\n--> enter 'y', 'milk', or 'no milk' to stay, and 'n' to leave <--"
            menu_details_second
        end
    end


    def menu_milk
        puts "\nSelect a number to learn more about your favorite drink's fuel to foam ratio or enter 'exit' to leave."
        input = gets.chomp.downcase
        if input == "exit"
            puts "Don't forget to espresso yourself."
        elsif !input.to_i.between?(1, Drink.milk.count)
            milk_drinks
            doesnt_exist
            select_drink
            menu_milk
        else
            drink = Drink.sorted_milk[input.to_i-1]
            drink_details(drink)
            puts "\nWould you like to see another drink (y / n) or perhaps visit the main or milk-free beverage lists (main / no milk)?"
            menu_milk_second
        end
    end

    def menu_milk_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "May your coffee kick in before reality does."
        elsif round_two == "y"
            milk_drinks
            menu_milk
        elsif round_two == "main"
            list_drinks
            menu_details
        elsif round_two == "no milk"
            no_milk_drinks
            menu_no_milk
        else 
            try_again_boost
            puts "\n--> enter 'y', 'main', or 'no milk' to stay, and 'n' to leave <--"
            menu_milk_second
        end
    end


    def menu_no_milk
        puts "\n\nSelect a number to learn more about your favorite milk-free drink or enter 'exit' to leave."
        input = gets.chomp.downcase
        if input == "exit"
            puts "Stay grounded."
        elsif !input.to_i.between?(1, Drink.no_milk.count)
            no_milk_drinks
            doesnt_exist
            select_drink
            menu_milk
        else
            drink = Drink.sorted_no_milk[input.to_i-1]
            drink_details(drink)
            puts "\nWould you like to see another drink (y / n) or perhaps visit the main or milk-containing beverage lists (main / milk)?"
            menu_no_milk_second
        end
    end

    def menu_no_milk_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "Sometimes we go hours without drinking coffee. It’s called sleeping."
        elsif round_two == "y"
            no_milk_drinks
            menu_no_milk
        elsif round_two == "main"
            list_drinks
            menu_details
        elsif round_two == "milk"
            milk_drinks
            menu_milk
        else 
            try_again_boost
            puts "\n--> enter 'y', 'main', or 'milk' to stay, and 'n' to leave <--"
            menu_no_milk_second
        end
    end


    def list_drinks
        sorted_drinks = Drink.all.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end
    
    def milk_drinks
        sorted_drinks = Drink.milk.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end
    
    def no_milk_drinks
        sorted_drinks = Drink.no_milk.sort_by {|drink| drink.name}
        sorted_drinks.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}
    end

    def drink_details (drink)
        puts "\nOrder up! One #{drink.name}:"
        puts "\n#{drink.description}"
        puts "\n#{drink.ratio}"
        puts "#{drink.cup}"
        puts "Milk: #{drink.milk}"
    end






end





# def menu_milk_third
    #     round_three = gets.chomp.downcase 
    #     if round_three = "y"
    #         milk_drinks

    #     if round_three = "main"
    #         list_drinks
    #         puts "\nWhat's in a name? A drink by any other name would taste as sweet.\n\nTo learn more about a specific beverage enter its corresponding number below or type 'exit' to leave."
    #         menu_details
    #     elsif round_three = "no milk"
    #         no_milk_drinks
    #         menu_no_milk
    #     elsif round_three = "exit"
    #         puts "Well, bye I guess."
    #     else 
    #         try_again_boost
    #         puts puts "\n--> enter 'main', 'milk', or 'no milk' <--"
    #         menu_milk_third
    #     end
    # end

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