class BestSchools::Scraper
  
  def self.scrape_districts
    doc = Nokogiri::HTML(open("https://www.niche.com/k12/search/best-school-districts/m/houston-metro-area/"))
    
    #districts = doc.css("div.search-results ol.search-results__list li.search-results__list__item div.search-result div.card a.search-result__link div.card__inner h2") 
      ### #is there a way to make this shorter? ###need to add .text to pull text from array 
    #binding.pry   
  
  #districts = page.css("ol.search-results__list  div.search-result")
  
#districts.each do |district|
#  name = district.css("h2.search-result__title").text
#  url = district.css("a.search-result__link").attr("href")
#  puts name
#  puts url 
#  puts 
#
#end

  
  
  end 
  
end 