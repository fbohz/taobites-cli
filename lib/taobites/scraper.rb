class Taobites::Scraper
 #doc = Nokogiri::HTML(open(""))
 #puts doc.css("#CSS-Selector-Here")
 
 
 def self.new_ddj_bite #must refactor
 chapter = rand(0..82)
 taobite = {}
 taobite[:book] = "Daodejing"
  if chapter == 0 || chapter == 82
    taobite[:book] = "Daodechip! v2"
    puts "\nWow! You hit a byte! Lets see if you get lucky.."  
    doc = Nokogiri::HTML(open("./assets/taotechipv2.html"))
    taobite[:chapter] = rand(1..81)
    taobite[:passage] = doc.css("##{taobite[:chapter]}").text
      sleep 2
      puts ".."
      sleep 1
      puts "..."
      sleep 2
      puts "...."
    puts "Chapter: #{taobite[:chapter]}\n" unless taobite[:passage].include?("Your lucky byte returned")
    sleep 1
    puts "#{taobite[:passage]}\n"
     = 
  else 
    doc = Nokogiri::HTML(open("http://thetaoteching.com/taoteching#{chapter}.html"))
     taobite[:chapter] = chapter
      puts "Retrieving your Taobite.."
      sleep 2
      puts ".."
      sleep 1
      puts "..."
      sleep 2
      puts "...."
    puts "Chapter: #{taobite[:chapter]}\n" #this should be taobite.ddj.chapter_num
    sleep 1
    taobite[:passage] = doc.css("td#loTBody").text #this should be taobite.ddj.chapter_num
    puts "#{taobite[:passage]}\n"
    end
  taobite
end 
  
  def self.new_zz_bite #must refactor
    web_section = rand(1..98)
    taobite = {}
    taobite[:book] = "Zhuangzi"
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
        taobite[:chapter] = "#{chapter_num}: #{chapter_title}"
        puts "Excerpt from Chapter #{chapter_num}: #{chapter_title} \n"    
           sleep 1
          
        content = doc.css("div#content") #main container
        remove_title = content.css("h3").text 
        excerpt = content.text.gsub(remove_title, "") #assigns and removes reduntant title
        taobite[:passage] = excerpt.gsub(/(previous page |next page)/, "") #removes next, previous page text 
        puts "#{taobite[:passage]}\n"
    taobite 
    else 
      taobite = {}  
      taobite[:book] = "Zhuangzi"
      doc = Nokogiri::HTML(open("http://nothingistic.org/library/chuangtzu/chuang#{web_section}.html"))
      puts "REFACTOR ME..!"
      taobite[:passage] = "REFACTOR ME..!"
      taobite[:chapter] = "REFACTOR ME..!"
   end 
      taobite
  end 
#binding.pry
end 
