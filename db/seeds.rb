require 'faker'


auditions = []
(1..40).each do |num|
    auditions << {actor: Faker::Name.name, location:  Faker::Address.city, phone: Faker::PhoneNumber.phone_number, hired: false, role_id: rand(1..5)}
end

auditions.each do |audition|
    Audition.create(audition)
end

roles = []
(1..5).each do |num|
    roles << {character_name: Faker::Superhero.name}
end

roles.each do |role|
    Role.create(role)
end