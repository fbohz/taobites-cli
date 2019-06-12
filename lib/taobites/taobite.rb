
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
  
  def new_taobite_ddj
    a_taobite = self 
	    a_taobite.tap do |taobite|
	      Taobites::Scraper.new_ddj_bite.each do |k,v|
	        taobite.send("#{k}=", v)
	     end 	 
	   end 
	   #@@all << self
  end 
  
  def new_taobite_zz
    a_taobite = self 
      Taobites::Scraper.new_zz_bite 
	    a_taobite.tap do |taobite|
	      Taobites::Scraper.new_zz_bite .each do |k,v|
	        taobite.send("#{k}=", v)
	     end 	 
	   end 
	   #@@all << self
  end 
  
end   

