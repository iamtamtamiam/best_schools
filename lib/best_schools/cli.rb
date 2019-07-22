#My CLI controller

class BestSchools::CLI 
  
  def call
    puts "Welcome! According to Niche, the best districts in 2019 of the Houston Area are:"
    get_district_rankings
    #list_districts 
    get_user_district_selection
    #list_district_info
  end 
    
  def get_district_rankings
    #scrape the districts off the site, put it in array?...remember to try to take out sponsored districts
    @districts = ["Friendswood", "Katy", "Tomball", "Pearland"]
  end 
    
  def get_user_district_selection
    #list the districts
    @districts.each_with_index{|district, index|
      puts "#{index.to_i + 1}. #{district}"
    } 
  end 
  
end 