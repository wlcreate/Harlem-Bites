User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all
User.reset_pk_sequence
Restaurant.reset_pk_sequence
Reservation.reset_pk_sequence

#User instances
wavey = User.create(name: "Waverley", phone_number: "(718)986-6758", password: "wavey")
nunny = User.create(name: "Nunny", phone_number: "(212)222-2222", password: "nico")

#Restaurant instances
# NEED TO FIGURE OUT THE TIME DATA TYPE
seasoned = Restaurant.create(name: "Seasoned Vegan", seating_capacity: rand(1..10), address: "55 Saint Nicholas Ave, New York, NY 10026", telephone: "(212)222-0092", hours_open: "5:00 - 10:00pm", cuisine: "Vegan Soul Food", pricey: "$$$", stars: "⭐️⭐️⭐️⭐️⭐️")
grange = Restaurant.create(name: "The Grange", seating_capacity: rand(1..10), address: "1635 Amsterdam Ave, New York, NY 10031", telephone: "(212)491-1635", hours_open: "5:00 - 10:00pm", cuisine: "American", pricey: "$$", stars: "⭐️⭐️⭐️")
rooster = Restaurant.create(name: "Red Rooster", seating_capacity: rand(1..10), address: "310 Lenox Avenue New York, NY 10027", telephone: "(212)792-9001", hours_open: "5:00 - 10:00pm", cuisine: "Southern", pricey: "$$$", stars: "⭐️⭐️⭐️⭐️")
barawine = Restaurant.create(name: "Barawine", seating_capacity: rand(1..10), address: "200 Lenox Ave New York, NY 10027", telephone: "(646)756-4154", hours_open: "5:00 - 10:00pm", cuisine: "French", pricey: "$$", stars: "⭐️⭐️⭐️⭐️⭐️")
lido = Restaurant.create(name: "Lido", seating_capacity: rand(1..10), address: "2168 Frederick Douglass Blvd. New York, NY 10026", telephone: "(646)490-8575", hours_open: "5:00 - 10:00pm", cuisine: "Italian", pricey: "$$", stars: "⭐️⭐️⭐️⭐️")
diagonal = Restaurant.create(name: "La Diagonal", seating_capacity: rand(1..10), address: "185 Saint Nicholas Ave New York, NY 10026", telephone: "(212)418-1220", hours_open: "5:00 - 10:00pm", cuisine: "Traditional Mexican, Mexican, Tapas/Small Plates", pricey: "$$", stars: "⭐️⭐️⭐️")
pub = Restaurant.create(name: "Harlem Public", seating_capacity: rand(1..10), address: "3612 Broadway, New York, NY 10031", telephone: "(212)939-9404", hours_open: "5:00 - 10:00pm", cuisine: "American", pricey: "$$", stars: "⭐️⭐️⭐️")
sylvia = Restaurant.create(name: "Sylvia's", seating_capacity: rand(1..10), address: "328 Malcolm X Blvd, New York, NY 10027", telephone: "(212)996-0660", hours_open: "5:00 - 10:00pm",cuisine: "Soul Food", pricey: "$$", stars: "⭐️⭐️⭐️⭐️")
edge = Restaurant.create(name: "The Edge", seating_capacity: rand(1..10), address: "101 Edgecombe Ave, New York, NY 10030", telephone: "(212)939-9688", hours_open: "5:00 - 10:00pm", cuisine: "Caribbean", pricey: "$$", stars: "⭐️⭐️⭐️⭐️")
amor = Restaurant.create(name: "Amor Cubano", seating_capacity: rand(1..10), address: "2018 3rd Ave, New York, NY 10029", telephone: "(212)996-1220", hours_open: "5:00 - 10:00pm", cuisine: "Cuban", pricey: "$$", stars: "⭐️⭐️⭐️⭐️")

#Reservation instances
rez_1 = Reservation.create(party_size: 3, date: "08/27/2020 6:30pm", user_id: nunny.id, restaurant_id: sylvia.id)
rez_2 = Reservation.create(party_size: 2, date: "09/05/2020 5:30pm", user_id: nunny.id, restaurant_id: grange.id)
rez_3 = Reservation.create(party_size: 2, date: "09/12/2020 6:00pm", user_id: nunny.id, restaurant_id: edge.id)
rez_4 = Reservation.create(party_size: 4, date: "10/14/2020 7:00pm", user_id: nunny.id, restaurant_id: lido.id)
rez_5 = Reservation.create(party_size: 2, date: "08/27/2020 5:30pm", user_id: wavey.id, restaurant_id: seasoned.id)
rez_6 = Reservation.create(party_size: 3, date: "09/02/2020 6:00pm", user_id: wavey.id, restaurant_id: sylvia.id)
rez_7 = Reservation.create(party_size: 3, date: "09/19/2020 6:15pm", user_id: wavey.id, restaurant_id: amor.id)
rez_8 = Reservation.create(party_size: 4, date: "10/04/2020 7:45pm", user_id: wavey.id, restaurant_id: pub.id)

puts "🐰🐰🐰🐰🐰🐰🐰🐰"