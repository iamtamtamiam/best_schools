class BestSchools::District
  
  attr_accessor :name, :overall_niche_grade, :population, :number_of_schools, :percent_proficient_reading, :percent_proficient_math, :student_teacher_ratio
  
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    
    @@all << self 
  end 
  
  def self.all
    BestSchools::Scraper.scrape_districts if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end 
  
end 