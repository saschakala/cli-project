class Scraper

    DRINK_URL = "https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html"

    def self.scrape_drinks
        html = open(DRINK_URL)
        doc = Nokogiri::HTML(html)
        binding.pry
    end


end

# url: https://www.webstaurantstore.com/article/397/types-of-coffee-drinks.html