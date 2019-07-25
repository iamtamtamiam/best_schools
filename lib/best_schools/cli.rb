#My CLI controller

class BestSchools::CLI 
  
  def call
    puts "\nWelcome! According to Niche, the best districts in 2019 of the Houston Area are:\v".colorize(:black).on_light_white.bold #additional spacing
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
     puts "\vTo view additional details of a district, please enter its ranking number (1-#{BestSchools::District.all.count}).".colorize(:blue).italic
  end 
  
  def get_user_district_selection
    @district_selection = gets.strip.to_i
    #scrape the distrct page and get attributes of the district(rank grade, total schools, number of students, percent proficient in reading, percent proficient in math, student teacher ratio)
    if @district_selection > 0 && @district_selection <= @districts.length
      #puts "selection worked"
      show_district_info_for(@district_selection)
      return_or_exit
    else 
      puts "\vYou have entered an invalid response.\v".colorize(:red).bold
      call
      #list_districts #may have to move the input (gets.strip) up to list districts.
    end 
  end 
  
  def return_or_exit
    puts "\vIf you would like to view another district's information, please enter 'r' or 'return' to return to the ranking list.".colorize(:green).italic
    puts "If you would like to exit the program, please enter 'e' or 'exit.".colorize(:red).italic
    exit_option = gets.strip.downcase 
    if exit_option == "r".downcase || exit_option == "return".downcase
      call
    elsif exit_option == "e".downcase || exit_option == "exit".downcase
      puts "Good-bye!".colorize(:black).on_white.bold
    else 
      puts "You have entered and invalid response.".colorize(:red).bold
      return_or_exit
    end 
  end 
  
  def show_district_info_for(district_selection)
    actual_selection = @districts[district_selection - 1]
    puts "\vDetails on #{actual_selection.name}:".colorize(:blue).bold.underline
    actual_selection.district_details
    puts "\tThe Student-Teacher Ratio is #{actual_selection.student_teacher_ratio}"
    puts "\tThe Percent Proficient in Reading is #{actual_selection.percent_proficient_reading}"
    puts "\tThe Percent Proficient in Math is #{actual_selection.percent_proficient_math}"
    puts "\tThe Average Graduation Rate is #{actual_selection.graduation_rate}"
    puts "\tThe Total Number of Schools is #{actual_selection.number_of_schools}"
    puts "\tThe Total Number of Students is #{actual_selection.number_of_students}"
  end 
  
  
end 