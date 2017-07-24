# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# Destroy old records
puts "Destroying old records..."
ClientsMatch.destroy_all
Message.destroy_all
Answer.destroy_all
Choice.destroy_all
Question.destroy_all
EssentialAttribute.destroy_all
Client.destroy_all
VikingCoordinator.destroy_all
puts "Old records destroyed.\n\n"

CHOICES = [%w(North West Central East South), 
           %w(Black Brown Red Blond),
           %w(Introvert Extrovert Any)]

# Create Client
puts "Creating 15 clients..."
15.times do |i|  
   first_name = Faker::Name.first_name
   Client.create(first_name: first_name,
                 last_name: Faker::Name.last_name,
                 email: Faker::Internet.free_email(first_name),
                 sex: %w(M F).sample,
                 age: rand(18..100),
                 city: Faker::Address.city,
                 state: Faker::Address.state_abbr,
                 zip: Faker::Address.zip,
                 about_myself: Faker::Lorem.sentences(2))
end
puts "15 clients created."


 Client.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 email: Faker::Internet.free_email("Nancy"))


# Create Question and Choice
Question.create(question_text: "Where do you want to live?")
Question.create(question_text: "Ideal hair color of partner" )
Question.create(question_text: "Prefer introvert, extrovert, or any personality?")
puts "3 questions created."

# Create Choice
Question.all.each do |question|
  question.question_text
  CHOICES[(question.id-1)].each_with_index do |choice, index|
    Choice.create(option: choice,
                  position: (index + 1),
                  question_id: question.id)
  end
end

# Create Answer
Client.all.each do |client|
  Question.all.each do |question|
    Answer.create(
              choice_id: rand(1..CHOICES[question.id - 1].length),
              priority: rand(1..3),
              question_id: question.id,
              client_id: client.id
              )
  end
end



    Answer.create(
              choice_id: 3,
              priority: 1,
              question_id: 1,
              client_id: 4
              )














####################################



def generate_address(stored_address_type, stored_address_id)
  Address.create(street_address: Faker::Address.street_address,
                 city: Faker::Address.city,
                 state_abbr: Faker::Address.state_abbr,
                 zip: Faker::Address.zip,
                 stored_address_type: stored_address_type,
                 stored_address_id: stored_address_id)
end

#Create Clients
puts "Creating 10 clients..."
10.times do |i|  
  client = Client.create(name: Faker::Company.name)
  generate_address("Client", client.id)
end
puts "10 clients created."
