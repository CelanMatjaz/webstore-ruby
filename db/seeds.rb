# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(username: 'admin', email: 'admin@admin.com', password: 'password',
             password_confirmation: 'password', is_admin: true)

group1 = ProductGroup.create!(name: 'Computer & Accessories', image_url: '/product_groups/laptop.jpg')
group2 = ProductGroup.create!(name: 'Books', image_url: '/product_groups/fiction_book.png')
group3 = ProductGroup.create!(name: 'Audio/Video', image_url: '/product_groups/dvd.jpg')

ProductSubgroup.create!(name: 'Laptops', product_group: group1, image_url: '/product_groups/laptop.jpg')
ProductSubgroup.create!(name: 'Monitors', product_group: group1, image_url: '/product_groups/monitor.jpg')
ProductSubgroup.create!(name: 'PCs', product_group: group1, image_url: '/product_groups/pc.jpg')

ProductSubgroup.create!(name: 'Fiction', product_group: group2, image_url: '/product_groups/fiction_book.png')
ProductSubgroup.create!(name: 'Sports', product_group: group2, image_url: '/product_groups/sports_book.png')
ProductSubgroup.create!(name: 'Science', product_group: group2, image_url: '/product_groups/science_book.png')

ProductSubgroup.create!(name: 'CDs', product_group: group3, image_url: '/product_groups/cd_logo.png')
ProductSubgroup.create!(name: 'DVDs', product_group: group3, image_url: '/product_groups/dvd.jpg')
ProductSubgroup.create!(name: 'Blu-ray', product_group: group3, image_url: '/product_groups/bluray.png')

[group1, group2, group3].each do |group|
  group.product_subgroups.each do |subgroup|
    i = 1
    while i < 10
      subgroup.products.create!(name: "#{subgroup.name}#{i}", quantity: 100, image_url: subgroup[:image_url])
      i += 1
    end
  end
end
