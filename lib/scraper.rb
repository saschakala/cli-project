class Scraper

    DRINK_URL = "https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html"

    def self.scrape_drinks
        doc = Nokogiri::HTML(open(DRINK_URL))
        doc.css("div.blog-highlight-wrap").each do |drink|
            name = drink.css("h3").text
            milk = if drink.css("li.icon-check").text.include?("milk") == true
                "yes"
            else
                "no"
            end
            Drink.new(name, milk)
        end
    end

    def self.scrape_drink_details
    end
    


end

# url: https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html