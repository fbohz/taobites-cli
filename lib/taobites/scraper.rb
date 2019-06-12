#require "./assets/taotechip.html"

class Taobites::Scraper
 #doc = Nokogiri::HTML(open(""))
 #puts doc.css("#CSS-Selector-Here")
 
 
 def self.new_ddj_bite
 chapter = rand(0..82)
  if chapter == 0 || chapter == 82
    puts "\nWow! You hit a byte! Lets see if you get lucky.."  
    doc = Nokogiri::HTML(open("./assets/taotechip.html"))
    chapter_chip = rand(1..81)
    chapter_text = doc.css("##{chapter_chip}").text
      sleep 2
      puts ".."
      sleep 1
      puts "..."
      sleep 2
      puts "...."
    puts "Chapter: #{chapter_chip}\n" unless chapter_text.include?("Your lucky byte returned")
    sleep 1
    puts "#{chapter_text}\n"
  else 
    doc = Nokogiri::HTML(open("http://thetaoteching.com/taoteching#{chapter}.html"))
      puts "Retrieving your Taobite.."
      sleep 2
      puts ".."
      sleep 1
      puts "..."
      sleep 2
      puts "...."
    puts "Chapter: #{chapter}\n" #this should be taobite.ddj.chapter_num
    sleep 1
    chapter_text = doc.css("td#loTBody").text #this should be taobite.ddj.chapter_num
    puts "#{chapter_text}\n"
    end   
  end 
  
  
 #binding.pry
end 

#binding.pry