FactoryBot.define do
  factory :user do
    nickname              { 'タケ' }
    email                 { Faker::Internet.free_email }
    password              { "takeshi1998" }
    password_confirmation { password }
    last_name             { '大岡' }
    first_name            { '岳士' }
    last_name_kana        { 'オオオカ' }
    first_name_kana       { 'タケシ' }
    birth_day             { '1998-10-16' }
  end
end
