class Taobites::CLI
  
  def run 
    self.welcome 
    sleep 0.5
    puts self.menu
    sleep 0.5
    self.selection
    self.return_text
    
  end 
    
    #binding.pry
   

  
  def welcome 
    puts "\n\nWelcome to your daily dosis of Taobites!\n\n\n"
  end   
  
  def menu
      # Taobites offers you a excrept from the Zhuangzi and the Daodejing. 
      # There's also a surprise if you get lucky enough. 
    <<-HEREDOC
   
   -For a Daodejing excrept please type DDJ. 
   -For a Zhuangzi excrept please type ZZ. 
   -To have us choose for you, type luck.
   -To list all available commands please type list or ls. 
   -To quit please type q.

   HEREDOC
  end   
  
   def input
    @input
   end 
  
  def selection
    puts "Please make a selection"
    @input = gets.strip.downcase
    @input
  end 
  
 
  
  def return_text
    #puts input
    case 
    when input == "ddj" || "daodejing" || "taoteching"
      Taobites::Scraper.new_ddj_bite 
    when input == "zz" || "zhuangzi" || "chuangtzu"
      Taobites::Scraper.new_zz_bite 
    when input == "q" || "quit" || "exit" || "exit!"
      self.quit 
    else 
      "Error, wrong input received"
      sleep 0.5 
      puts self.menu
      self.selection
  end  
  
  end   
  
  def quit
    
  end 
  
  #ok so its retrieving the ddj text but is not catching my input correctly. I will stop recording. My next steps will be to capture input correctly. THen I will refactor Scraper because it contains another class methods. Then I will modify CLI. So that each class does what is suppose to do. At the end I want the CLI to ask if they want another text or repeat the last one with @@all. Also will provide a lucky entry based upon the logic on appropiate class (right now I have it on Scraper.)
  
  #Right now I'm  scraping a file (for lucky entry), a DDJ website and ZZ website for appropiate texts. Thanks! Felipe Bohorquez
  
end   
