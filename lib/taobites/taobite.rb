
class Taobites::Taobite 
  attr_accessor :book, :chapter, :passage, :url  
  @@all = []
  
  def initialize(book=nil, chapter=nil, passage=nil, url=nil)
    @book = book
    @chapter = chapter
    @passage = passage
    @url = url
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
	   a_taobite
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
	   a_taobite
  end 
  
end   

