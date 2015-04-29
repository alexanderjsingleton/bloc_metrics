require 'faker'
 
# Create an admin user
 admin = User.new(
   # name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!

 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!



# Create Users
5.times do
  user = User.new(
    # name:     Faker::Name.name,
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
  name:         Faker::Name.name, 
   url:         Faker::Internet.url 
 )
end
applications = Application.all

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
