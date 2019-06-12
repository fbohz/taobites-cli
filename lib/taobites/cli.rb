class Taobites::CLI
  
  def run 
    self.welcome 
    sleep 0.5
    puts self.menu
    sleep 0.5
    self.selection
    self.return_text
    
  end 

  
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
    return_input = input.gsub(" ", "")
    case return_input 
    when "ddj", "daodejing", "taoteching"
     # binding.pry
      Taobites::Scraper.new_ddj_bite 
    when "zz", "zhuangzi", "chuangtzu"
      puts "hi"
      Taobites::Scraper.new_zz_bite 
    when "q", "quit", "exit", "exit!"
      self.quit 
    else 
      binding.pry
      puts "ERROR! wrong input received. Try again."
      sleep 2
      puts self.menu
      self.selection
      self.return_text
  end  
  
  end   
  
  def quit
    puts "Goodbye! See next time"
    sleep 1
    system('clear') 
  end 
  
  
  
  
  
  
  
end   
