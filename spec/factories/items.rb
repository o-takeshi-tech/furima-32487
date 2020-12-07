FactoryBot.define do
  factory :item do
    name                  { 'iPhone12' }
    description           { Faker::Lorem.sentences }
    category_id           { 3 }
    status_id             { 3 }
    delivery_fee_id       { 2 }
    prefecture_id         { 3 }
    day_to_deliver_id     { 2 }
    price                 { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/iPhone.jpeg'), filename: 'iPhone.jpeg')
    end
  end
end
