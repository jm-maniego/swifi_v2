# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clients
client_contact_person = [
  "James Gray",
  "Alan  Manning",
  "William Vaughan",
  "Warren  Abraham",
  "Lily  Roberts",
  "Ruth  Gibson",
  "Natalie Stewart",
  "Brandon Alsop",
  "Lauren  Baker",
  "Piers Berry",
  "Paul  Harris",
  "Cameron Quinn",
  "Julia Graham",
  "Sam Sanderson",
  "Trevor  Knox",
  "Sally Underwood",
  "Penelope  Welch",
  "Una Nash",
  "Gordon  Walker",
  "Mary  Greene",
  "Jake  Edmunds",
  "Felicity  McLean",
  "Lisa  Nolan",
  "Irene Young",
  "Michael North",
  "Colin James",
  "Julia Hemmings",
  "Leah  Scott",
  "Justin  Ball",
  "Anne  Ross",
]
client_names = [
  "Macroserve",
  "Magna Architectural Design",
  "Magna Consulting",
  "Magna Solution",
  "Matrix Architectural Service ",
  "Magik Gray",
  "Magik Grey",
  "Magik Lamp",
  "Magna Architectural Design",
  "Magna Gases",
  "Magna Wealth",
  "MagnaSolution",
  "ManCharm",
  "ManPower",
  "Manu Connection",
  "Maxaprofit",
  "Master Builder Design Services",
  "Matrix Architectural Service",
  "Matrix Design",
  "Matrix Interior Design",
  "Maxi-Tech",
  "Maxiserve ",
  "MegaSolutions",
  "Megatronic",
  "Megatronic Plus",
  "Merrymaking",
  "Micro Design",
  "Mikro Designs",
  "Mikrotechnic",
  "Millenia Life"
]
client_details    = client_names.zip(client_contact_person)
clients_to_create = []
puts "Creating fake clients lol..."
client_details.each do |client_name, contact_person|
  puts "creating #{client_name} - #{contact_person}"
  clients_to_create << {
    name: client_name,
    contact_person: contact_person,
    contact_number: "123 4567 890"
  }
end
Client.create!(clients_to_create)