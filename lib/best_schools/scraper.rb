class BestSchools::Scraper
  
  doc = Nokogiri::HTML(open("https://www.niche.com/k12/search/best-school-districts/m/houston-metro-area/"))
  
  districts = page.css("div.search-results ol.search-results__list li.search-results__list__item div.search-result div.card a.search-result__link div.card__inner h2")
  
end 