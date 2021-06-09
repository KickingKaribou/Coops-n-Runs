# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting users...'
User.destroy_all
puts 'Deleting farms...'
Farm.destroy_all

puts 'Creating users...'
User.create! ([
 {first_name: "Christian", last_name: "Boehme", email: "christian@lewagon.com", password: "123456"},
 {first_name: "Györgyi", last_name: "Farkas", email: "györgyi@lewagon.com", password: "123456"},
 {first_name: "Lisa", last_name: "Keßler", email: "lisa@lewagon.com", password: "123456"}
])

puts 'Creating farms...'
Farm.create! ([{
  name: "Geflügelhof Martin Zapf",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "0814401",
  address: "Im Roßgraben 1, 77723 Gengenbach-Schönberg",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  website_url: "https://www.gefluegelhof-zapf.de"
},
{
  name: "Geflügelhof Martin Zapf",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "0801551",
  address: "Im Roßgraben 1, 77723 Gengenbach-Schönberg",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  website_url: "https://www.gefluegelhof-zapf.de"
},
{
  name: "Geflügelhof Martin Zapf",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "0814351",
  address: "Fröschbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  website_url: "https://www.gefluegelhof-zapf.de"
},
{
  name: "Geflügelhof Martin Zapf",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "0814352",
  address: "Fröschbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  website_url: "https://www.gefluegelhof-zapf.de"
},
{
  name: "Geflügelhof Martin Zapf",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "0814353",
  address: "Fröschbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  website_url: "https://www.gefluegelhof-zapf.de"
},
# {
#   name: "Geflügelhof Unterer Berghof",
#   form_of_rearing: "Organic Rearing",
#   country: "Germany",
#   # laying_farm: "",
#   address: "Unterer Berghof, 72218 Wildberg",
#   # latitude:
#   # longitude:
#   # user_id:
#   # created_at:
#   # updated_at:
#   # area:
#   # chicken_count:
#   chicken_count: "1950"
#   website_url: "https://www.unterer-berghof.de"
# },
{
  name: "Nock-Hof",
  form_of_rearing: "Organic Rearing",
  country: "Germany",
  laying_farm: "0812691",
  address: "Kaiserstuhlstraße 1, 79279 Vörstetten",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  chicken_count: "14500"
  # website_url:
},
{
  name: "Biohof Breghof",
  form_of_rearing: "Organic Rearing",
  country: "Germany",
  laying_farm: "0819511",
  address: "Bräunlingen",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  # website_url:
},
{
  name: "Schäfer Hof",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "0808912",
  address: "Kehl Marlen",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  # website_url:
},
{
  name: "Schäfer Hof",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "0808913",
  address: "Kehl Marlen",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  # website_url:
},
{
  name: "Geflügelhof Ruh",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "0806972",
  address: "Lindenhof 1, 78244 Gottmadingen",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  chicken_count: "1600",
  website_url: "https://gefluegelhof-ruh.de"
},
{
  name: "Eierhof Heitzmann",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "0817832",
  address: "Schutterzell",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  # website_url:
},
{
  name: "Eierhof Heitzmann",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "0817831",
  address: "Schutterzell",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  # website_url:
},
{
  name: "Rhönland eG",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "1602018",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count:
  # website_url:
},
{
  name: "Rhönland eG",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "1602013",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Rhönland eG",
  form_of_rearing: "Free-range Rearing",
  country: "Germany",
  laying_farm: "1602016",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Rhönland eG",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "1602011",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Rhönland eG",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "1602012",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Rhönland eG",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "1602014",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Rhönland eG",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "1602015",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Rhönland eG",
  form_of_rearing: "Barn Rearing",
  country: "Germany",
  laying_farm: "1602017",
  address: "Am Lindig 1, 36466 Dermbach",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  # area:
  # chicken_count: ""
  website_url: "https://www.rhoenland-hof.de/home.html"
},
{
  name: "Farm Karbow II",
  form_of_rearing: "Free-range Rearing",
  country: "DE",
  laying_farm: "1300112",
  address: "17209 Melz/Karbow",
  # latitude:
  # longitude:
  user_id: User.all.sample.id,
  # created_at:
  # updated_at:
  area: "1560",
  chicken_count: "7540",
  description: "Family owned business for 2 generations in the south of Mecklenburg-Western Pomerania.
  Our chickens love the wide plains here."
}
])

puts 'We are ready!'
