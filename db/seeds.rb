# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create!(email: 'test@example.com', password: 'password')
user = User.first

project1 = user.projects.create!(name: 'Project Alpha', description: 'First project', status: 'Pending')
project2 = user.projects.create!(name: 'Project Beta', description: 'Second project', status: 'In Progress')

project1.comments.create!(user: user, content: 'This is the first comment.')
project2.comments.create!(user: user, content: 'Another project comment.')

project1.status_changes.create!(user: user, previous_status: 'Pending', new_status: 'In Progress')
project2.status_changes.create!(user: user, previous_status: 'In Progress', new_status: 'Completed')

puts 'Seed data created successfully!'