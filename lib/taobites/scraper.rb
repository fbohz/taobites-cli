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
  
  web_section = 9 #rand(1..98)
   if web_section == 9
     doc = Nokogiri::HTML(open("http://nothingistic.org/library/chuangtzu/chuang0#{web_section}.html"))
      puts "Retrieving your Taobite.."

        # sleep 2
        # puts ".."
        # sleep 1
        # puts "..."
        # sleep 2
        # puts "...."
      chapter_num = doc.css(".section2").text.match(/\d/).to_s
      chapter_title = doc.css(".section3").text
      
        # sleep 1
      puts "Excerpt from Chapter #{chapter_num}: #{chapter_title} \n"    
        # sleep 1
        remove = { :prev => "previous page", :next => "next page" }
       
      
      content = doc.css("div#content")
      #assigns and removes reduntant title
      remove = content.css("h3").text
      excerpt = content.text.gsub(remove, "")
      #removes next, previous page text 
      excerpt = excerpt.gsub(/(previous page |next page)/, "")
       binding.pry
      
       
   else 
     doc = Nokogiri::HTML(open("http://nothingistic.org/library/chuangtzu/chuang#{web_section}.html"))
  end 

binding.pry
end 
