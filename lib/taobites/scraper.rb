class Taobites::Scraper
 #doc = Nokogiri::HTML(open(""))
 #puts doc.css("#CSS-Selector-Here")
 
 
 def self.new_ddj_bite #must refactor
 chapter = rand(0..82)
  if chapter == 0 || chapter == 82
    puts "\nWow! You hit a byte! Lets see if you get lucky.."  
    doc = Nokogiri::HTML(open("./assets/taotechipv2.html"))
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
  
  def self.new_zz_bite #must refactor
    web_section = rand(1..98)
     if web_section < 10
       doc = Nokogiri::HTML(open("http://nothingistic.org/library/chuangtzu/chuang0#{web_section}.html"))
        puts "Retrieving your Taobite.."
          sleep 2
          puts ".."
          sleep 1
          puts "..."
          sleep 2
          puts "...."
        chapter_num = doc.css(".section2").text.match(/\d/).to_s
        chapter_title = doc.css(".section3").text
        puts "Excerpt from Chapter #{chapter_num}: #{chapter_title} \n"    
           sleep 1
          
        content = doc.css("div#content") #main container
        remove_title = content.css("h3").text 
        excerpt = content.text.gsub(remove_title, "") #assigns and removes reduntant title
        excerpt = excerpt.gsub(/(previous page |next page)/, "") #removes next, previous page text 
        puts "#{excerpt}\n"
         
    else 
        
      doc = Nokogiri::HTML(open("http://nothingistic.org/library/chuangtzu/chuang#{web_section}.html"))
      puts "refactor me"
   end 
  end 
#binding.pry
end 
