FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    information { Faker::Lorem.sentence }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    cost_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    sendday_id { rand(2..4) }
    price { Faker::Commerce.price(range: 300..9999999).to_i }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end