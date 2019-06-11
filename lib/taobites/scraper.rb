class Scraper
 doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
 #puts doc.css("#CSS-Selector-Here")
 #binding.pry
end 
