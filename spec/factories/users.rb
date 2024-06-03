FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { Faker::Japanese::Name.first_name }
    first_name_kana { generate_katakana }
    last_name { Faker::Japanese::Name.last_name }
    last_name_kana { generate_katakana }
    birthday { Faker::Date.backward(days: 365 * 25) }
  end
end

def generate_katakana
  katakana = ''
  rand(3..7).times do
    katakana << [*'ァ'..'ン'].sample
  end
  katakana
end
