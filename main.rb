# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here
puts "checks if candidate is experienced"
puts experienced?(@candidates[0])
puts "-----"

puts "find should return candidate with matching id"
puts find(5)
puts "-----"

puts "filter candidates to only include qualified candidates"
puts qualified_candidates(@candidates)
puts "-----"

puts "sort candidates by most experience then github points"
puts ordered_by_qualifications(@candidates)
puts "-----"

pp @candidates