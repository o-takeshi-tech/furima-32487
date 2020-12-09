FactoryBot.define do
  factory :order_address do
    postal_code     {"111-1111"}
    prefecture_id   {3}
    city            {"千葉市"}
    address_line    {"青山"}
    phone_number    {"00000000000"}
    token           {"sk_test_ef9d311f7d4039c649701fb9"}
  end
end
