# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Seed church members
20.times do
  ChurchMember.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 80),
    date_joined: Faker::Date.backward(days: 365 * 20)
  )
end

# Seed events
10.times do
  starts_at = Faker::Time.forward(days: 365, period: :morning)
  Event.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    starts_at: starts_at,
    ends_at: starts_at + rand(1..4).hours,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraph
  )
end
