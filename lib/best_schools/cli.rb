#My CLI controller

class BestSchools::CLI 
  
  def call
    puts "Welcome! According to Niche, the best districts in 2019 of the Houston Area are:" #additional spacing would be great.""
    get_district_rankings
    list_districts 
    get_user_district_selection #let input be a number 
    #show_district_info_for(@district_selection)
  end 
    
  def get_district_rankings
    #scrape the districts off the site, put it in array?...remember to try to take out sponsored districts
    #BestSchools::District.new("Friendswood")
    #BestSchools::District.new("Katy")
    #@districts = ["Friendswood", "Katy", "Tomball", "Pearland"]
    @districts = BestSchools::District.all 
    #binding.pry 
  end 
    
  def list_districts
    @districts.each_with_index{|district, index|
      puts "#{index.to_i + 1}. #{district.name}"
    } 
     puts "To view additional details of a district, please enter its ranking number (1-#{BestSchools::District.all.count})."
  end 
  
  def get_user_district_selection
    @district_selection = gets.strip.to_i
    #scrape the distrct page and get attributes of the district(rank grade, total schools, number of students, percent proficient in reading, percent proficient in math, student teacher ratio)
    if @district_selection > 0 && @district_selection <= @districts.length
      #puts "selection worked"
      show_district_info_for(@district_selection)
    else 
      puts "You have entered an invalid response."
      #call
      #list_districts #may have to move the input (gets.strip) up to list districts.
    end 
  end 
  
  def show_district_info_for(district_selection)
    actual_selection = @districts[district_selection - 1]
    puts "Details on #{actual_selection.name}"
    actual_selection.district_details
    puts "The Student-Teacher Ratio is #{actual_selection.student_teacher_ratio}"
    puts "The Percent Proficient in Reading is #{actual_selection.percent_proficient_reading}"#might need another method to format details next
    puts "The Percent Proficient in Math is #{actual_selection.percent_proficient_math}"
    puts "The Average Graduation Rate is #{actual_selection.graduation_rate}"
    puts "The Total Number of Schools is #{actual_selection.number_of_schools}"
    puts "The Total Number of Students is #{actual_selection.number_of_students}"
    
    #BestSchools::District.all...build find_by_name method in district class?
    #puts attributes like district.rank_grade
  end 
  
  
end 