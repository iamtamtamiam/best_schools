class BestSchools::Scraper
  
  def self.scrape_districts
    doc = Nokogiri::HTML(open("https://www.niche.com/k12/search/best-school-districts/m/houston-metro-area/"))
    
    #districts = doc.css("div.search-results ol.search-results__list li.search-results__list__item div.search-result div.card a.search-result__link div.card__inner h2") 
      ### #is there a way to make this shorter? ###need to add .text to pull text from array 
    #binding.pry   
  
    districts = doc.css("ol.search-results__list  div.search-result")
  
    districts.each do |district|
      name = district.css("h2.search-result__title").text
      url = district.css("a.search-result__link").attr("href")
      new_district = BestSchools::District.new(name, url)
      
      
      #@schools = district.css("div.search-result-fact span.search-result-fact__value")[0].text
      #@students = district.css("div.search-result-fact span.search-result-fact__value")[1].text
      
      #schools = district.css("div.search-result-fact span.search-result-fact__value")[0].text
      #students = district.css("div.search-result-fact span.search-result-fact__value")[1].text
      
      new_district.number_of_students = district.css("div.search-result-fact span.search-result-fact__value")[0].text 
      new_district.number_of_schools = district.css("div.search-result-fact span.search-result-fact__value")[1].text
      #how do i set students and schools equal to thier attributes
      #binding.pry 
    end
    
    
  end 
  
  def self.scrape_details(district)
    url = district.url
    doc = Nokogiri::HTML(open(url))
    
    district.student_teacher_ratio = doc.css("section.block--two#teachers div.scalar__value span").first.text
    
    academics = doc.css("section.block--two-two#academics div.scalar__value span")
    #academics.each do |subject|
    district.percent_proficient_reading = academics[0].text
    district.percent_proficient_math = academics[1].text
    district.graduation_rate = academics[2].text
    
    #district.number_of_schools = @schools
    #district.number_of_students = @students
    ##binding.pry
  end 
  
end 