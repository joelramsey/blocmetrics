# Create Users
3.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create an admin user
admin = User.new(
  name: 'joel ramsey',
  email: 'joel.d.ramsey@gmail.com',
  password: 'bomb2336'
  )
admin.skip_confirmation!
admin.save!

# Create a member
member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.skip_confirmation!
member.save!

# Create Registered Application
5.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Lorem.word,
    url: Faker::Internet.url
    ) 

end

registered_applications = RegisteredApplication.all

registered_applications.each do | registered_application |
  # Create Events
  5.times do
    Event.create!(
      registered_application: registered_application,
      #user_id: registered_application.user_id,
      name: Faker::Lorem.word
      )
  end
end

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"