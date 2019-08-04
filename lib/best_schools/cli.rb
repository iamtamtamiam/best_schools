class BestSchools::CLI 
  
  def call
    until exit_input 
    puts "\nWelcome! According to Niche, the current best districts of the Houston Area are:\v".colorize(:black).on_light_white.bold
    get_district_rankings
    list_districts 
    get_user_district_selection #let input be a number
    end
    puts "Good-bye!".colorize(:black).on_white.bold
  end 
    
  def get_district_rankings
    @districts = BestSchools::District.all 
  end 
    
  def list_districts
    @districts.each_with_index{|district, index| puts "#{index.to_i + 1}. #{district.name}"} 
     puts "\vTo view additional details of a district, please enter its ranking number (1-#{BestSchools::District.all.count})".colorize(:blue).italic
     puts "To exit, please enter 'exit' or 'e'.".colorize(:red).italic
  end 
  
  def get_user_district_selection
    @input = gets.strip
    unless exit_input
      if valid_input
        show_district_info_for(@input.to_i)
        return_or_exit
      else 
        puts "\vYou have entered an invalid response. Please enter a number between 1 and #{@districts.length} or, to exit the program, enter 'e' or exit'.\v".colorize(:red).bold
        get_user_district_selection
      end
    end 
  end 
  
  def valid_input
    @input.to_i > 0 && @input.to_i <= @districts.length #@district_selection.to_i.between?(1, @districts.length)
  end 
  
  def exit_input
    @input.to_s.downcase == "exit".downcase || @input.to_s.downcase == "e".downcase
  end 
  
  def return_or_exit
    puts "\vIf you would like to view another district's info, please enter 'r' or 'return' to return to the ranking list.".colorize(:green).italic
    puts "If you would like to exit the program, please enter 'e' or 'exit.".colorize(:red).italic
    @input = gets.strip.downcase 
    unless exit_input
      if @input == "r".downcase || @input == "return".downcase
        list_districts
      else 
        puts "You have entered and invalid response.".colorize(:red).bold
        return_or_exit
      end 
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