# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Appointment.destroy_all
Coach.destroy_all

cost_per_hour = [50, 65, 75, 100]
10.times do |index|
  coach = Coach.new(name: Faker::Name.name, location: Faker::Address.full_address, charge_per_hour: "$#{cost_per_hour[rand(3)]}", qualification: )
  coach.image.attach(io: File.open('app/assets/images' + "/coach#{index + 1}.png"), filename: "coach#{index + 1}.png", content_type: 'image/png')
  coach.save
end
