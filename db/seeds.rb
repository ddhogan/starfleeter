# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### Crew people ###
roger = Crew.create(name: 'Roger', rank: 'Sergeant', specialty: 'dancing', clearance: true, password_digest: BCrypt::Password.create('cilantro'))
roger.save

bobby = Crew.create(name: "Bobby Droptables", rank: 'Ensign', specialty: 'skateboarding', clearance: false, password_digest: BCrypt::Password.create('password'))
bobby.save

dax = Crew.create(name: "Jadzia Dax", rank: 'Lieutenant', specialty: 'science', clearance: true, password_digest: BCrypt::Password.create('curzon'))
dax.save

crusher = Crew.create(name: "Dr. Beverly Crusher", rank: 'Commander', specialty: 'medicine', clearance: true, password_digest: BCrypt::Password.create('gates'))
crusher.save

### Ships ###
voyager = Ship.create(name: 'Voyager', type_class: 'Galaxy', warp_factor: 7, complement: 500, note: "Lost in the delta quadrant")
voyager.save

enterprise = Ship.create(name: 'Enterprise', type_class: 'Sovereign', warp_factor: 9.8, complement: 2000, note: "")
enterprise.save

honshu = Ship.create(name: 'Honshu', type_class: 'Nebula', warp_factor: 6, complement: 200, note: "docked for repair")
honshu.save

lakota = Ship.create(name: 'Lakota', type_class: 'Excelsior', warp_factor: 8, complement: 1000, note: "test")
lakota.save