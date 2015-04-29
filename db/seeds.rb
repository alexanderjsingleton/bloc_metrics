# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
 
# Create an admin user
 admin = User.new(
   # name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!



 # Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


 # Create Applications
 10.times 
   Application.create!(
     url:         Faker::Internet.url 
   )
 end
 topics = Topic.all

#Create Events
 50.times do
  Event.create!(
    user:   users.sample,
    application:  Applications.sample,
    name:  Events.sample
  )
end
event = Events.all

 puts "Seed finished"
 puts "#{Event.count} events created"
 puts "#{Application.count} applications created"
 