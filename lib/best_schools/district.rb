class BestSchools::District
  
  attr_accessor :name, :url, :district_info, :student_teacher_ratio, :percent_proficient_reading, :percent_proficient_math, :graduation_rate, :number_of_students, :number_of_schools
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @district_info = [] #dont think I need this anymore
    save
  end 
  
  def self.all
    BestSchools::Scraper.scrape_districts if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end 
  
  def district_details
    BestSchools::Scraper.scrape_details(self) unless percent_proficient_math
  end 
end 