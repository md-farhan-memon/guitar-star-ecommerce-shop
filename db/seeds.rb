# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
guitar_brands = %w[Martin Taylor Gibson Guild Seagull Yamaha Ovation Washburn Fender Epiphone]
pick_brands = %w[Clayton D'Addario Dava National Riversong]
strap_brands = %w[Fender Dunlop DiMarzio Gibson Onori]
models = ['Dreadnought', 'Parlour', 'Jumbo', 'Round-Shoulder Dreadnought', 'Auditorium', 'Grand Auditorium', 'Classical', 'Small Body / Travel']
guitar_categories = %w[Electric Acoustic]
pick_categories = %w[Wooden Plastic]
strap_categories = %w[Regular Large Extra\ Large]
strings = %w[4 5 6]

# Creating categories
(guitar_categories | pick_categories | strap_categories).each { |category| Category.create(name: category) }

# Creating guitars
guitar_categories.each do |category|
  category_id = Category.find_by_name(category).id
  guitar_brands.each.with_index(1) do |brand, index|
    Guitar.create(
      name: "#{brand} #{category} Guitar #{index}",
      brand: brand,
      model: models.sample,
      number_of_strings: strings.sample,
      price: (1000..10_000).to_a.sample,
      category_id: category_id
    )
  end
end

# Creating product units
Product.where(type: 'Guitar').each do |guitar|
  (10..50).to_a.sample.times do
    guitar.product_units.create(
      bought_on: Time.at(rand * Time.now.to_i)
    )
  end
end

# Creating picks
pick_categories.each do |category|
  category_id = Category.find_by_name(category).id
  pick_brands.each.with_index(1) do |brand, index|
    Pick.create(
      name: "#{brand} #{category} Pick #{index}",
      brand: brand,
      price: (100..500).to_a.sample,
      available_quantity: (10..100).to_a.sample,
      category_id: category_id
    )
  end
end

# Creating straps
strap_categories.each do |category|
  category_id = Category.find_by_name(category).id
  strap_brands.each.with_index(1) do |brand, index|
    Strap.create(
      name: "#{brand} #{category} Strap #{index}",
      brand: brand,
      price: (100..500).to_a.sample,
      available_quantity: (10..100).to_a.sample,
      category_id: category_id
    )
  end
end
