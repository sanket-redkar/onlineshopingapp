# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_initialize_by(email: 'admin@shopingcard.com')
user.password = 'shopingcard123'
user.role = 'admin'
user.save

['Acoustic', 'Electric', 'Electro-acoustic', 'Twelve-string', 'Archtop', 'Steel', 'Touch', 'Resonator', 'Bass', 'Double-neck'].each do |name|
  brand = Brand::Gitar.find_or_initialize_by(name: name)
  brand.description = "This is a #{name} gitar."
  brand.save
end

Brand::Gitar.all.each do |brand|
  (10000..10005).to_a.each do
    10.times do |i|
      price = Faker::Number.number(4)
      product = brand.products.build({
        serial_number: Faker::IDNumber.valid,
        image: open(Faker::Avatar.image),
        modal_id: (1000..1005).to_a.sample,
        strings: [3, 4,6,8].sample,
        price: price,
        description: Faker::Lorem.sentence,
        bought_date: Faker::Date.backward(30)
      })
      product.save
    end
  end
end

(10000..10005).to_a.each do
  10.times do |i|
    price = Faker::Number.number(4)
    accessory = Accessory.new({
      serial_number: Faker::IDNumber.valid,
      name: 'Guitar Picks',
      image: open(Faker::Avatar.image),
      modal_id: (1000..1005).to_a.sample,
      data: {type: ['wooden', 'plastic'].sample}.to_json,
      price: price,
      description: Faker::Lorem.sentence,
      bought_date: Faker::Date.backward(30)
    })

    accessory.save
  end
  10.times do |i|
    price = Faker::Number.number(4)
    accessory = Accessory.new({
      serial_number: Faker::IDNumber.valid,
      name: 'Straps',
      image: open(Faker::Avatar.image),
      modal_id: (1000..1005).to_a.sample,
      data: {size: ['Large', 'Reguler', 'extra large'].sample}.to_json,
      price: price,
      description: Faker::Lorem.sentence,
      bought_date: Faker::Date.backward(30)
    })
    accessory.save
  end
end