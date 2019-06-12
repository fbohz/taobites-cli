class Taobites::CLI
  
  def run 
    
    self.welcome 
    sleep 0.5
    self.list
    sleep 0.5

  end 

  
  def welcome 
    puts "\n\nWelcome to your daily dosis of Taobites!\n\n\n"
  end   
  
  def list
      
    puts "\n-For a Daodejing excrept please type DDJ."
    puts "-For a Zhuangzi excrept please type ZZ."
    puts "-To list all available commands please type list or ls."
    puts "-To quit please type q."

    self.selection
  end
  
   def input
    @input
   end 
  
  def selection
    puts "\nPlease make a selection. You can also type ls for all available commands"
    
    @input = gets.strip.downcase
    @input
    
    self.check_selection
  end 
  
 def check_selection
      case input
      when "ls", "list", "menu"
        self.list
      when "q", "quit", "exit", "exit!"
        self.quit  
    else   
      self.return_taobite
    end
  end 
  
  def return_taobite
    
    return_input = input.gsub(" ", "")
    case return_input 
    when "ddj", "daodejing", "taoteching"
      taobite_object = Taobites::Taobite.new.new_taobite_ddj
      self.ddj_printer(taobite_object)
      self.return_menu?
    when "zz", "zhuangzi", "chuangtzu"
      taobite_object = Taobites::Taobite.new.new_taobite_zz
      self.zz_printer(taobite_object)
      self.return_menu?
    else 
      puts "ERROR! wrong input received. Try again."
      sleep 2
      self.return_menu?
   end  
  end 
  
  def return_menu?
    puts "\nWould you like to return to the Main Menu to make another selection? \n Y/N"
    res = gets.strip.downcase
    if res == "y" || res == "yes"
      self.run 
    else 
      self.quit
    end 
  end 
  
  
  
  def quit
    puts "Goodbye! See you next time"
    sleep 1
    system('clear') 
  end 
  
  def ddj_printer(taobite_object)
      puts "Retrieving your Taobite.."
      sleep 0.5
      puts ".."
      sleep 1.5
      puts "..."
      sleep 2
      puts "...."
    puts "Chapter: #{taobite_object.chapter}" unless taobite_object.passage.include?("Your lucky byte returned")
    sleep 1
    puts "#{taobite_object.passage}\n"
    sleep 2  
  end 
  
  def zz_printer(taobite_object)
    puts "Retrieving your Taobite.."
          sleep 2
          puts ".."
          sleep 1
          puts "..."
          sleep 2
          puts "...."
      puts "Excerpt from Chapter #{taobite_object.chapter}\n"    
          sleep 2  
      puts "#{taobite_object.passage[0..1500]...}" #truncates to only the first 1500 words or so
      puts "\nWanna read more? See the complete Chapter at: #{taobite_object.url}\n"
      sleep 4  
  end 
  
end   
