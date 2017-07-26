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

# Create EssentialAttributes

Client.all.each do |client|
  min_age = [20, 30, 40, 50].sample
  max_age = min_age + 10
  EssentialAttribute.create(sex: %w(M F).sample,
                             min_age: min_age,
                             max_age: max_age,
                             client_id: client.id)
end

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

# Create Message ... by/to random clients (incl a returned message from recipient), with various values in fields "read" and "desire_to_like_you"
10.times do |i| 
  sendable_id = Client.pluck(:id).sample
  receivable_id = Client.pluck(:id).sample until receivable_id != sendable_id # must not send to oneself
  read = false; read = true if i == 7 
  message = Message.create( message_text: Faker::Lorem.sentences(2),
                  sendable_id: sendable_id,
                  receivable_id: receivable_id,
                  sendable_type: "Client",
                  receivable_type: "Client",
                  read: read,
                  desire_to_like_you: rand(-1..+1)
                  )
end
# receiver gets message and sends back message
sendable_id = Client.pluck(:id).sample
receivable_id = Client.pluck(:id).sample until receivable_id != sendable_id # must not send to oneself
  # sender
Message.create( message_text: Faker::Lorem.sentences(2),
                sendable_id: sendable_id,
                receivable_id: receivable_id,
                sendable_type: "Client",
                receivable_type: "Client",
                read: true,
                desire_to_like_you: 1
                )
  # receiver
Message.create( message_text: Faker::Lorem.sentences(2),
                sendable_id: receivable_id,
                receivable_id: sendable_id,
                sendable_type: "Client",
                receivable_type: "Client",
                read: false,
                desire_to_like_you: 1
                )


# Create ClientsMatch
Client.all.each do |matcher|
  Client.all.each do |matchee|
    next if matcher.id == matchee.id
    # here assess match of essential attributes
    unless essential_attributes_pass?(matcher, matchee)
      match_score = -1
    else
      # here calculate scores
      match_score = calculate_match_score(matcher, matchee)
    end
    clientsmatch = ClientsMatch.create(score: match_score,
                          thumb: 0,
                          matcher_id: matcher.id,
                          matchee_id: matchee.id)
  end
end

def essential_attributes_test?(matcher, matchee)
  matcher_attr = matcher.essential_attributes
  matchee_attr = matchee.essential_attributes
  return false if matcher_attr.first.sex != matchee.sex || \
  (matcher_attr.first.max_age..matcher_attr.first.min_age) === matchee.age
  true
end

def calculate_match_score(matcher, matchee)
  score = 0
  matcher.answers.order("question_id").each do |answer|
    if answer.choice_id == matchee.answers.where("question_id = ?", answer.question_id).first.choice_id
      score += answer.priority
    end
  end
  score
end

# Create VikingCoordinator
VikingCoordinator.create(name: "Erik Trautman")

# Create Message ... VikingCoordinator to random client and v.v.  (incl a returned message from recipient) and "desire_to_like_you" set to zero.

sendable_id = VikingCoordinator.id
receivable_id = Client.pluck(:id).sample
  # sender
Message.create( message_text: Faker::Lorem.sentences(2),
                sendable_id: sendable_id,
                receivable_id: receivable_id,
                sendable_type: "Viking Coordinator",
                receivable_type: "Client",
                read: true,
                desire_to_like_you: 0
                )
  # receiver
Message.create( message_text: Faker::Lorem.sentences(2),
                sendable_id: receivable_id,
                receivable_id: sendable_id,
                sendable_type: "Client",
                receivable_type: "Viking Coordinator",
                read: false,
                desire_to_like_you: 0
                )


