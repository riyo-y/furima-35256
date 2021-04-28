FactoryBot.define do
  factory :item do
    
    japanese_user = Gimei.name

    products_name             { Faker::Lorem.sentence }
    price                     { Faker::Commerce.price(range: 300..50_000,as_string: true) }
    category_id               { Faker::Number.between(from: 2, to: 11) }
    products_states_id        { Faker::Number.between(from: 2, to: 7) }
    shipping_id               { Faker::Number.between(from: 2, to: 3) }
    admins_information_id     { Faker::Number.between(from: 2, to: 30) }
    arrival_date_id           { Faker::Number.between(from: 2, to: 4) }
    comments                  { Faker::Lorem.sentence }
    

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
