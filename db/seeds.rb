User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all
#SafetyPrecaution.destroy_all
User.reset_pk_sequence
Restaurant.reset_pk_sequence
Reservation.reset_pk_sequence
#SafetyPrecaution.reset_pk_sequence

#User instances
waverley = User.create(name: "Waverley", phone_number: "(718)986-6758", password: "wavey")
#nunny = User.create(name: "Nunny", phone_number: "", password: )

#Restaurant instances
# NEED TO FIGURE OUT THE TIME DATA TYPE
restaurant1 = Restaurant.create(name: "Seasoned Vegan", seating_capacity: rand(1..10), address: "55 Saint Nicholas Ave, New York, NY 10026", telephone: "(212)222-0092", open_time: "17:00:00", close_time: "22:00:00", cuisine: "Vegan Soul Food", pricey: "$$$", stars: "⭐️⭐️⭐️⭐️⭐️")
# restaurant2 = Restaurant.create(
#     name: "The Grange", 
#     seating_capacity: rand(1..10), 
#     address: "1635 Amsterdam Ave, New York, NY 10031", 
#     telephone: "(212)491-1635", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "American", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️")
# restaurant3 = Restaurant.create(
#     name: "Red Rooster", 
#     seating_capacity: rand(1..10), 
#     address: "310 Lenox Avenue New York, NY 10027", 
#     telephone: "(212)792-9001", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "Southern", 
#     pricey: "$$$", 
#     stars: "⭐️⭐️⭐️⭐️")
# restaurant4 = Restaurant.create(
#     name: "Barawine", 
#     seating_capacity: rand(1..10), 
#     address: "200 Lenox Ave New York, NY 10027", 
#     telephone: "(646)756-4154", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "French", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️⭐️⭐️")
# restaurant5 = Restaurant.create(
#     name: "Lido", 
#     seating_capacity: rand(1..10), 
#     address: "2168 Frederick Douglass Blvd. New York, NY 10026", 
#     telephone: "(646)490-8575", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "Italian", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️⭐️")
# restaurant6 = Restaurant.create(
#     name: "La Diagonal", 
#     seating_capacity: rand(1..10), 
#     address: "185 Saint Nicholas Ave New York, NY 10026", 
#     telephone: "(212)418-1220", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "Traditional Mexican, Mexican, Tapas/Small Plates", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️")
# restaurant7 = Restaurant.create(
#     name: "Harlem Public", 
#     seating_capacity: rand(1..10), 
#     address: "3612 Broadway, New York, NY 10031", 
#     telephone: "(212)939-9404", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "American", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️")
# restaurant8 = Restaurant.create(
#     name: "Sylvia's", 
#     seating_capacity: rand(1..10), 
#     address: "328 Malcolm X Blvd, New York, NY 10027", 
#     telephone: "(212)996-0660", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "Soul Food", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️⭐️")
# restaurant9 = Restaurant.create(
#     name: "The Edge", 
#     seating_capacity: rand(1..10), 
#     address: "101 Edgecombe Ave, New York, NY 10030", 
#     telephone: "(212)939-9688", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "Caribbean", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️⭐️")
# restaurant10 = Restaurant.create(
#     name: "Amor Cubano", 
#     seating_capacity: rand(1..10), 
#     address: "2018 3rd Ave, New York, NY 10029", 
#     telephone: "(212)996-1220", 
#     open_time: "17:00:00", 
#     close_time: "22:00:00", 
#     cuisine: "Cuban", 
#     pricey: "$$", 
#     stars: "⭐️⭐️⭐️⭐️")

#Reservation instances

puts "🐰🐰🐰🐰🐰🐰🐰🐰"