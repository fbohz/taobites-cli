class Taobites::CLI
  
  def run 
    
    
    # self.welcome 
    # sleep 0.5
    # puts self.menu
    # sleep 0.5
    self.selection
    self.return_taobite
    
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
  
 
  
  def return_taobite
    #puts input
    return_input = input.gsub(" ", "")
    case return_input 
    when "ddj", "daodejing", "taoteching"
      Taobites::Taobite.new.new_taobite_ddj
      self.ddj_printer
    when "zz", "zhuangzi", "chuangtzu"
      puts "hi"
      Taobites::Taobite.new.new_taobite_zz
      self.zz_printer
    when "q", "quit", "exit", "exit!"
      self.quit 
    else 
      puts "ERROR! wrong input received. Try again."
      sleep 2
      puts self.menu
      self.selection
      self.return_taobite
  end  
  
  end   
  
  def quit
    puts "Goodbye! See you next time"
    sleep 1
    system('clear') 
  end 
  
  def ddj_printer
      sleep 2
      puts ".."
      sleep 1
      puts "..."
      sleep 2
      puts "...."
    puts "Chapter: #{taobite[:chapter]}\n" unless taobite[:passage].include?("Your lucky byte returned")
    sleep 1
    puts "#{taobite[:passage]}\n"
  end 
  
  def zz_printer
    puts "Retrieving your Taobite.."
          sleep 2
          puts ".."
          sleep 1
          puts "..."
          sleep 2
          puts "...."
      puts "Excerpt from Chapter #{taobite[:chapter]}\n"    
          sleep 1  
      puts "#{taobite[:passage]}\n"
  end 
  
end   
