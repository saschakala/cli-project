
# puts "A cuppa a day keeps the doctor away."
# 
# puts "Don't forget to espresso yourself."
# 

class CoffeeDrinks

    def call
        greeting
        Scraper.scrape_drinks
        puts "\nType 'list' to see a list of espresso beverages.\n\n** alternatively, for the lactose challenged, type 'milk' or 'no milk' to see drinks that both will and won't give you indigestion **\n\n --> enter 'list', 'milk', or 'no milk' to caffeinate and 'exit' to leave <--"
        menu_main
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
            puts "\nI know, I know: our latte art needs work. But wait, what about a nice strong cup of tea?"
            tea_menu_details
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
            puts "\nAre you, perhaps, more of a tea person?"
            tea_menu_details
        elsif !input.to_i.between?(1, Drink.all.count)
            list_drinks
            doesnt_exist
            menu_details 
        else
            drink = Drink.sorted_all[input.to_i-1]
            drink_details(drink)
            puts "\nWould you like to see another drink (y / n), view brews by milk content (milk / no milk), or could we perhaps interest you in a German pastry to go with your coffee (pastry)?"
            menu_details_second
        end
    end

    def menu_details_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "\nWhat about a nice cup of tea (y / n)?"
            tea_menu
        elsif round_two == "milk"
            milk_drinks
            menu_milk
        elsif round_two == "no milk"
            no_milk_drinks
            menu_no_milk
        elsif round_two == "pastry"
            pastry_menu_details
        elsif round_two == "y"
            list_drinks
            puts "\nSelect a number to get drink details or type 'exit' to leave."
            menu_details
        else 
            try_again_boost
            puts "\n--> enter 'y', 'milk', 'no milk', or 'pastry' to stay, and 'n' to leave <--"
            menu_details_second
        end
    end


    def menu_milk
        puts "\nSelect a number to learn more about your favorite drink's fuel to foam ratio or enter 'exit' to leave."
        input = gets.chomp.downcase
        if input == "exit"
            puts "\nMaybe some tea would help?"
            tea_menu_details
        elsif !input.to_i.between?(1, Drink.milk.count)
            milk_drinks
            doesnt_exist
            menu_milk
        else
            drink = Drink.sorted_milk[input.to_i-1]
            drink_details(drink)
            puts "\nWould you like to see another drink (y / n), visit the main or milk-free beverage lists (main / no milk), or could we perhaps tempt you with a German pastry (pastry)?"
            menu_milk_second
        end
    end

    def menu_milk_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "Psych! How about a cup of tea before you go (y / n)?"
            tea_menu
        elsif round_two == "y"
            milk_drinks
            menu_milk
        elsif round_two == "main"
            list_drinks
            menu_details
        elsif round_two == "no milk"
            no_milk_drinks
            menu_no_milk
        elsif round_two == "pastry"
            pastry_menu_details
        else 
            try_again_boost
            puts "\n--> enter 'y', 'main', 'no milk', or 'pastry' to stay, and 'n' to leave <--"
            menu_milk_second
        end
    end


    def menu_no_milk
        puts "\n\nSelect a number to learn more about your favorite milk-free drink or type 'exit' to leave."
        input = gets.chomp.downcase
        if input == "exit"
            puts "These warm drinks definitely don't have milk - maybe you're more interested in tea?"
            tea_menu_details
        elsif !input.to_i.between?(1, Drink.no_milk.count)
            no_milk_drinks
            doesnt_exist
            menu_no_milk
        else
            drink = Drink.sorted_no_milk[input.to_i-1]
            drink_details(drink)
            puts "\nWould you like to see another drink (y / n), visit the main or milk-containing beverage lists (main / milk), or could we get you a German pastry (pastry) to go with that coffee *lactaid not included* ?"
            menu_no_milk_second
        end
    end

    def menu_no_milk_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "Psych! How about a cup of tea before you go (y / n)?"
            tea_menu
        elsif round_two == "y"
            no_milk_drinks
            menu_no_milk
        elsif round_two == "main"
            list_drinks
            menu_details
        elsif round_two == "milk"
            milk_drinks
            menu_milk
        elsif round_two == "pastry"
            pastry_menu_details
        else 
            try_again_boost
            puts "\n--> enter 'y', 'main', 'milk', or 'pastry' to stay, and 'n' to leave <--"
            menu_no_milk_second
        end
    end

    def tea_menu
        input = gets.chomp.downcase
        if input == "y"
            Scraper.scrape_tea
            list_teas
            tea_menu_details
        elsif input == "n"
            puts "May your coffee kick in before reality does."
        else 
            try_again_boost
            puts "\n--> enter 'y' to stay (and learn about tea) or 'n' to leave <--"
            tea_menu
        end
    end


    def tea_menu_details
        Scraper.scrape_tea
        list_teas
        puts "\nTo learn more about a type of tea enter its corresponding number below. (Or if you really want to leave we promise this time we'll let you...just enter 'exit' below.)"
        input = gets.chomp.downcase
        if input == "exit"
            puts "No need to be sal-tea."
        elsif !input.to_i.between?(1, Tea.all.count)
            list_teas
            doesnt_exist
            tea_menu_details 
        else
            tea = Tea.sorted_all[input.to_i-1]
            tea_details(tea)
            puts "\nWould you like to see another tea (y / n) or could we perhaps interest you in a German pastry (pastry)?"
            tea_menu_details_second
        end
    end

    def tea_menu_details_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "What do you call a sad cup of coffee? A depresso."
        elsif round_two == "y"
            list_teas
            tea_menu_details
        elsif round_two == "pastry"
            pastry_menu_details
        else 
            try_again_boost
            puts "\n--> enter 'y', 'n', or 'pastry' <--"
            tea_menu_details_second
        end
    end


    def pastry_menu_details
        Scraper.scrape_pastries
        list_pastries
        puts "\nTo learn more about a pastry enter its corresponding number below."
        input = gets.chomp.downcase
        if input == "exit"
            puts "Not so fast, how about some tea?"
            tea_menu_details
        elsif !input.to_i.between?(1, Pastry.all.count)
            list_pastries
            try_again_boost
            pastry_menu_details
        else
            pastry = Pastry.sorted_all[input.to_i-1]
            pastry_details(pastry)
            puts "\nWould you like to see another pastry (y / n) or maybe you're ready for some tea (tea) or more coffee (coffee)?"
            pastry_menu_details_second
        end
    end

    def pastry_menu_details_second
        round_two = gets.chomp.downcase 
        if round_two == "n"
            puts "Sometimes we go hours without drinking coffee. It’s called sleeping."
        elsif round_two == "y"
            list_pastries
            pastry_menu_details
        elsif round_two == "tea"
            tea_menu_details
        elsif round_two == "coffee"
            list_drinks
            menu_details
        else 
            try_again_boost
            puts "\n--> enter 'y', 'n', 'tea', or 'coffee' <--"
            pastry_menu_details_second
        end
    end





    def list_drinks
        Drink.all.sort_by {|drink| drink.name}.tap{|drink| drink.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}}
    end
    
    def milk_drinks
        Drink.milk.sort_by {|drink| drink.name}.tap{|drink| drink.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}}
    end
    
    def no_milk_drinks
        Drink.no_milk.sort_by {|drink| drink.name}.tap{|drink| drink.each.with_index(1) { |drink, i| puts "#{i}. #{drink.name}"}}
    end

    def list_pastries
        Pastry.all.sort_by {|pastry| pastry.name}.tap{|pastry| pastry.each.with_index(1) { |pastry, i| puts "#{i}. #{pastry.name}"}}
    end

    def list_teas
        Tea.all.sort_by {|tea| tea.name}.tap{|tea| tea.each.with_index(1) { |tea, i| puts "#{i}. #{tea.name}"}}
    end


    def drink_details (drink)
        puts "\nOrder up! One #{drink.name}:"
        puts "\n#{drink.description}"
        puts "\n#{drink.ratio}"
        puts "#{drink.cup}"
        puts "Milk: #{drink.milk}"
    end

    def tea_details (tea)
        puts "\nOrder up! One #{tea.name}:"
        puts "\n#{tea.description}"
        puts "\n#{tea.flavor}"
        puts "\n#{tea.varieties}"
    end

    def pastry_details (pastry)
        puts "\nOrder up! One #{pastry.name}:"
        puts "\n#{pastry.description}"
    end



    def greeting
        puts "Hello! And welcome to the Bevvie Bevy: an interactive experience for coffee connoisseurs and novices alike.\n\nHave you ever wondered what the difference is between a flat white and long black? If so, the Bevy is here to help."
    end

    def try_again_boost
        puts "\nLooks like you need a boost of caffeine! Give it another go, we didn't quite catch that."
    end

    def doesnt_exist
        puts "\nLooks like that drink doesn't exist yet! Try again, captain."
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