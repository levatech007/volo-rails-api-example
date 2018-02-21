# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Location.destroy_all
Review.destroy_all
Calendar.destroy_all

# Users
users_data = []
10.times do
  first_name = FFaker::Name.first_name
  last_name = FFaker::Name.last_name
  users_data << {
    name: first_name + " " + last_name,
    password: "abcd1234",
    email: "#{first_name[0]}_#{last_name}@example.com".downcase
  }
end

users = User.create(users_data)

location_names = ["Millbrae", "Main Street", "Lincoln Blvd"]
airports = ["SFO", "LAX", "JFK"]
locations_data = []
airports.each do |airport|
  locations_data << {
    name: location_names.sample,
    airport: airport,
    rating: 3.5
  }
end
locations = Location.create(locations_data)

reviews_data = []
first_name = FFaker::Name.first_name
10.times do
  reviews_data << {
    author: first_name,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lorem lacus,
    vulputate cursus sodales id, feugiat sit amet arcu. Vestibulum et tortor consequat
    purus dictum egestas eget in turpis. Nulla aliquet eros vel mattis luctus.",
    user: users.sample,
    location: locations.sample
  }
end

reviews = Review.create(reviews_data)
