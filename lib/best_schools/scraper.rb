class BestSchools::Scraper
  
  def self.scrape_districts
    doc = Nokogiri::HTML(open("https://www.niche.com/k12/search/best-school-districts/m/houston-metro-area/"))
    districts = doc.css("ol.search-results__list  div.search-result")
  
    districts.each do |district|
      name = district.css("h2.search-result__title").text
      url = district.css("a.search-result__link").attr("href")
      new_district = BestSchools::District.new(name, url)
    
      new_district.number_of_schools = district.css("div.search-result-fact span.search-result-fact__value")[0].text 
      new_district.number_of_students = district.css("div.search-result-fact span.search-result-fact__value")[1].text
    end
  end 
  
  def self.scrape_details(district)
    url = district.url
    doc = Nokogiri::HTML(open(url))
    
    district.student_teacher_ratio = doc.css("section.block--two#teachers div.scalar__value span").first.text
    
    academics = doc.css("section.block--two-two#academics div.scalar__value span")
    percentages = academics.collect{|subject| subject.text if subject.text != nil}
    district.percent_proficient_reading = percentages[0]
    district.percent_proficient_math = percentages[1]
    district.graduation_rate = percentages[2]
  end 
  
end 