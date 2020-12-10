FactoryBot.define do
  factory :order_address do
    postal_code     { '111-1111' }
    prefecture_id   { 3 }
    city            { '千葉市' }
    address_line    { '青山' }
    building        { '柳ビル' }
    phone_number    { '00000000000' }
    token           { 'test_factory_bot_000000000' }
    user_id         { 1 }
    item_id         { 1 }
  end
end
