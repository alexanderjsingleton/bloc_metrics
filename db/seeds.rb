# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
# Create an admin user
 admin = User.new(
   # name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!

 #Create test user
test = User.new(
  email: 'test@example.com',
  password: 'helloworld'
  )

test.skip_confirmation!
test.save
 
 5.times do
  registered_applications = Application.create!(
    user: test,
    url: Faker::Internet.url
    )
end

registered_applications = Application.all

#Create events
10.times do
  events = Event.create!(
    application: registered_applications.sample,
    # event_name: Faker::Hacker.say_something_smart
    event_name: Faker::Hacker.ingverb 
    )
end


puts "Seeds finished"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"
