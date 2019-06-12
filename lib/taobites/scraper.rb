class Scraper
 doc = Nokogiri::HTML(open("http://htmlpreview.github.io/?https://github.com/fbohz/juega/blob/master/Scrape/Taobites/taotechip.html"))
 #puts doc.css("#CSS-Selector-Here")
 binding.pry
end 
