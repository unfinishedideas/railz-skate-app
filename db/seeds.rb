# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'pry'

Spot.destroy_all
Review.destroy_all
User.destroy_all

unique = 0
user_array = []
spots = []

admin = User.create!(
  :user_name => 'admin',
  :email => 'admin@admin.com',
  :password => '123',
  :admin => true)

 testUser = User.create!(
  :user_name => 'testUser',
  :email => 'test@test.com',
  :password => '123',
  :admin => true)

  10.times do |index|
    user = User.create!(
      :user_name => "#{unique}_" + Faker::Superhero.name,
      :email => Faker::Lorem.characters(number: 10, min_alpha: 4) + "@user.com")
      unique += 1
      user_array.push(user)
    end

    p "Created #{User.count} users"

    8.times do |index|
      spots = []
      spots.push(Spot.create!(name: Faker::Verb.unique.base.capitalize() + " Park",
      lat: (45.50+((rand(0..8))*0.01)),
      lon: (-122.59+((rand(0..8))*0.01)),
      description: Faker::Space.distance_measurement + " from " +     Faker::Verb.unique.base.capitalize() + " Park",
      features: Faker::Construction.material + " " +   Faker::Appliance.equipment,
      spot_type: Faker::Movies::HitchhikersGuideToTheGalaxy.starship
      ))
      spots
      Review.create!(
        :title => Faker::Superhero.name,
        :content => Faker::Movies::Lebowski.quote,
        :user_id => user_array.sample.id,
        :rating => rand(1..5),
        :heat_lvl => rand(1..5),
        :spot_id => spots.sample.id
      )
    end

      Spot.create!(name: "Episk8us",
        lat: 45.520818,
        lon: -122.677441,
        description: "8th floor, indoor skate spot",
        features: "Couches, waxed desks, Nate and team",
        spot_type: "Indoor skatepark"
      )
      Review.create!(
        :title => "In an office building",
        :content => "I cam here all the way from Cali to skate here, but its just a programing school, WTF? this app sucks",
        :user_id => user_array.sample.id,
        :rating => 1,
        :heat_lvl => 3,
        :spot_id => spots.sample.id
      )

      Spot.create!(name: "Lincoln High School",
        lat: 45.5187955,
        lon: -122.6901429,
        description: "School located in the heart of Portland, with a bunch of stairs",
        features: "Curbs, Stairs and Gaps",
        spot_type: "School"
      )
      Review.create!(
        :title => "Its a School",
        :content => "I cam here all the way fomr Cali to skate here, but its just a School, WTF? this app sucks",
        :user_id => user_array.sample.id,
        :rating => 3,
        :heat_lvl => 5,
        :spot_id => spots.sample.id
      )

      Spot.create!(name: "Burnside",
        lat: 45.520818,
        lon: -122.677441,
        description: "Classic concrete skatepark heavy with punks",
        features: "Bowls, Vert Ramps, Rails, Transfers",
        spot_type: "Outdoor Skatepark"
      )
      Review.create!(
        :title => "The Classic",
        :content => "This is one of the oldest skateparks in the country, brutal concrete vert and a gnarly bowl",
        :user_id => user_array.sample.id,
        :rating => 5,
        :heat_lvl => 1,
        :spot_id => spots.sample.id
      )

      Spot.create!(name: "Rose Quater",
        lat: 45.5318103,
        lon: -122.6693538,
        description: "A schwank commercial district with a bunch of sets of stairs and the like",
        features: "Stairs, Rails, Manual Pads",
        spot_type: "Street"
      )
      Review.create!(
        :title => "Legit!",
        :content => "Right in the center of NE Portland, a huge varity of skate obsticals",
        :user_id => user_array.sample.id,
        :rating => 5,
        :heat_lvl => 5,
        :spot_id => spots.sample.id
      )

      Spot.create!(name: "Ed Benedict",
        lat: 45.4956271,
        lon: -122.5618315,
        description: "A street skatepark heavy with punks",
        features: "Stairs, Rails, Manual Pads, Kickers, Mini Snake Run",
        spot_type: "Street Park"
      )
      Review.create!(
        :title => "Not Even Suss",
        :content => "Its a good old street park and somehow its not even sus at all.",
        :user_id => user_array.sample.id,
        :rating => 4,
        :heat_lvl => 5,
        :spot_id => spots.sample.id
      )



    p "Created #{Spot.count} spots"
    p "Created #{Review.count} reviews"
