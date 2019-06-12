class Taobites::Scraper
 #doc = Nokogiri::HTML(open(""))
 #puts doc.css("#CSS-Selector-Here")
 
 
 #def self.temp
 chapter = rand(0..82)
  if chapter == 0 || chapter == 82
    puts "Wow! You hit a byte! Lets see if you get lucky.."  
    doc = Nokogiri::HTML(open("./assets/taotechip.html"))
    chapter_chip = rand(1..81)
    chapter_text = doc.css("##{chapter_chip}").text
      sleep 2
      puts ".."
      sleep 1
      puts "..."
      sleep 2
      puts "..."
    puts "Chapter: #{chapter_chip}\n"
    chapter_text
  else 
    doc = Nokogiri::HTML(open("http://thetaoteching.com/taoteching#{chapter}.html"))
    puts "Chapter: #{chapter}\n"
    chapter_text = doc.css("td#loTBody").text
    end   
  #end 
 binding.pry
end 

#binding.pry