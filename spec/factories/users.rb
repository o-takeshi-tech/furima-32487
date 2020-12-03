FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {}
    first_name            {}
    last_name_kana        {}
    first_name_kana       {}
    birth_day             {}

  end
end