FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation{password}
    first_name {Faker::Name.first_name}
    first_name_kana {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    last_name_kana {Faker::Name.last_name}
    birthday {Faker::Date.backward(days: 365 * 25)}
  end
end