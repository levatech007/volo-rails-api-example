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

locations_data = [{
  name: "Marriott Waterfront",
  airport: "SFO",
  airport_name: "San Francisco International Airport",
  place: "Millbrae, CA",
  rating: 3.5,
  description: "Great waterfront location that overlooks planes taking off and landing on runways 10R/28L and 10L/28R",
  latitude: 37.6040697,
  longitude: -122.3734245,
  timezone: -7,
},
{
  name: "In'n'Out @ W 92nd Street",
  airport: "LAX",
  airport_name: "Los Angeles International Airport",
  place: "Los Angeles, CA",
  rating: 4.5,
  description: "It’s only a short walk away from the edge of LAX runways 24R and 24L. Landing jets pass almost directly over the park.",
  latitude: 33.9531115,
  longitude: -118.3968193,
  timezone: -7,
},
{
  name: "Clutter's Park",
  airport: "LAX",
  airport_name: "Los Angeles International Airport",
  place: "Los Angeles, CA",
  rating: 3.5,
  description: "A lookout point with panoramic views of the airport. Marvel at the sheer beauty of physics in motion.",
  latitude: 33.9308675,
  longitude: -118.4115703,
  timezone: -7,
},
{
  name: "Maho Beach",
  airport: "SXM",
  airport_name: "Princess Juliana International Airport",
  place: "Sint Maarten",
  rating: 5.0,
  description: "Planes fly over beach-goers' heads and plane spotters cling to fences to feel the jet blast of aircraft taking off.",
  latitude: 18.0391175,
  longitude: -63.120365,
  timezone: -4,
}
]

locations = Location.create(locations_data)

reviews_data = []
names = ["Melissa", "John", "Jane", "Mary", "Dan", "Tom"]
ratings = [2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
10.times do
  reviews_data << {
    author: names.sample,
    title: "Lorem Ipsum",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lorem lacus,
    vulputate cursus sodales id, feugiat sit amet arcu. Vestibulum et tortor consequat
    purus dictum egestas eget in turpis. Nulla aliquet eros vel mattis luctus.",
    rating: ratings.sample,
    user: users.sample,
    location: locations.sample
  }
end

reviews = Review.create(reviews_data)
