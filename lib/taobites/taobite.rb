
class Taobites::Taobite 
  attr_accessor :book, :chapter, :passage 
  @@all = []
  
  def initialize(book=nil, chapter=nil, passage=nil)
    @book = book
    @chapter = chapter
    @passage = passage
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.new_taobite
    a_taobite = Taobites::Taobite.new
    return_taobite
	    a_taobite.tap do |taobite|
	      taobite.each do |k,v|
	        taobite.send("#{k}=", v)
	     end 	 
	   end 
  end 
  
end   

#this is more or less the method I will test. However, I still need to refactor Scraper. Will save github and be right back.