class BestSchools::District
  
  attr_accessor :name, :url, :district_info, :student_teacher_ratio
  #:overall_niche_grade, :population, :number_of_schools, :percent_proficient_reading, :percent_proficient_math, 
  
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @district_info = []
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
    BestSchools::Scraper.scrape_details(self) if @district_info.empty?
  end 
end 