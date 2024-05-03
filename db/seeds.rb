# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

n = 0

while n < 25
  User.create(username: format('username-%<n>s', n:), password: 'hashed_password', email: format('email-%<n>s', n:), is_admin: false,
              is_email_validated: false)
  n += 1
end
