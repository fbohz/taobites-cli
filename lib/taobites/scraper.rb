class Taobites::Scraper
 #doc = Nokogiri::HTML(open(""))
 #puts doc.css("#CSS-Selector-Here")
 
 #html = File.read('./assets/taotechip.html')
 chapter = rand(0..82)
 doc = Nokogiri::HTML(open("./assets/taotechip.html"))
 binding.pry
end 
