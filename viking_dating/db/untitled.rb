



Client.all.each do |client|
  min_age = [18, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80].sample
  max_age = min_age + 10
  EssentialAttribute.create(sex: %w(Male Female).sample,
                             min_age: min_age,
                             max_age: max_age,
                             client_id: client.id)