FactoryBot.define do
  factory :order_purchase do
    postcode               {'123-4567'}
    admins_information_id  { Faker::Number.between(from: 2, to: 30) }
    city                   {"大阪府"}
    block                  {"大阪"}
    phone_number           {'12345678912'}
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end