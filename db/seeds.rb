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
names = ["Melissa", "John", "Jane", "Mary", "Dan", "Tom"]
names.each do |name|
  users_data << {
    name: name,
    password: "abcd1234",
    email: "#{name}@example.com".downcase
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
names = ["Melissa", "John", "Jane", "Mary", "Dan", "Tom"]
10.times do
  reviews_data << {
    author: names.sample,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lorem lacus,
    vulputate cursus sodales id, feugiat sit amet arcu. Vestibulum et tortor consequat
    purus dictum egestas eget in turpis. Nulla aliquet eros vel mattis luctus.",
    user: users.sample,
    location: locations.sample
  }
end

reviews = Review.create(reviews_data)
