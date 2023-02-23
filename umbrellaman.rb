require "open-uri"
require "json"

 puts "Enter your location?"


 user_location = gets.chomp

# # user_location = "Saint Paul"
# puts "Checking the weather at #{user_location}...."

# # Get the lat/lng of location from Google Maps API

  gmaps_key = ENV.fetch("GMAPS_KEY")

 gmaps = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

#  gmaps = "https://maps.googleapis.com/maps/api/geocode/json?address=new yorkkey=AIzaSyB92cYxPcYqgjwBJfWlwDQw_7yjuyU3tpA"

#  gmaps = "https://maps.googleapis.com/maps/api/geocode/json?address=chicagokey=AIzaSyB92cYxPcYqgjwBJfWlwDQw_7yjuyU3tpA"


# ------------------------------------------------
# p gmaps

# p URI.open(gmaps).read
# ------------------------------------------------

#response =  URI.open("gmaps").read
response =  URI.open(gmaps).read


parse_data = JSON.parse(response)
results_array = parse_data.fetch("results")
first_result = results_array.at(0)
geo = first_result.fetch("geometry")
loc = geo.fetch("location")
latitude = loc.fetch("lat")
longitude = loc.fetch("lng")
p "latitude #{latitude}"
p "longitude #{longitude}"
