class Scraper

    DRINK_URL = "https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html"
    # PASTRY_URL = "https://en.wikipedia.org/wiki/List_of_pastries"
    # PASTRY_URL = "https://www.insider.com/best-german-desserts-2017-3#berliner-or-krapfen-4"
    PASTRY_URL = "https://www.insider.com/best-german-desserts-2017-3"

    def self.scrape_drinks
        doc = Nokogiri::HTML(open(DRINK_URL))
        doc.css("div.blog-highlight-wrap").each do |drink|
            name = drink.css("h3").text.strip
            ratio_cup = drink.css("li.icon-check")
            milk = if ratio_cup.text.include?("milk") || ratio_cup.text.include?("foam")|| ratio_cup.text.include?("cream") == true
                "yes"
            else
                "no"
            end
            description = drink.css("p").text
            ratio_cup_values = []
            ratio_cup.each {|value| ratio_cup_values << value.text }
            ratio = ratio_cup_values[0]
            cup = ratio_cup_values[1]
            Drink.new(name, milk, description, ratio, cup)
        end
    end

    def self.scrape_pastries
        doc = Nokogiri::HTML(open(PASTRY_URL))
        doc.css("div.slide").each do |pastry|
            name = pastry.css("h2.slide-title-text").text.strip
            description = pastry.css("p").text.strip
            Pastry.new(name)
        end
    end



        # doc.css("div.site-container").each do |pastry|
        #     i = 0
        #     name = pastry.css("h3")[i+=1].text
        #     binding.pry
           

    

    # text = doc.css("div.mw-content-ltr")
    # # split on \n\n\n
    # # table = doc.css("table.wikitable sortable jquery-tablesorter")


    # def self.scrape_drink_details (drink)
    #     doc = Nokogiri::HTML(open(DRINK_URL))
    #     doc.css("div.blog-highlight-wrap").each do |drink|
            

    # end
    


end

# url: https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html