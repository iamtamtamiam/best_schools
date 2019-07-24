require_relative "./best_schools/version"
require_relative "./best_schools/cli"
require_relative "./best_schools/district"
require_relative "./best_schools/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'


module BestSchools
  class Error < StandardError; end
  # Your code goes here...
end
