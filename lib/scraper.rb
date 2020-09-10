class Scraper

    DRINK_URL = "https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html"

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

    # def self.scrape_drink_details (drink)
    #     doc = Nokogiri::HTML(open(DRINK_URL))
    #     doc.css("div.blog-highlight-wrap").each do |drink|
            

    # end
    


end

# url: https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html