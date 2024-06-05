FactoryBot.define do
  factory :deal_address do
    housenumber { '123-4567' }
    prefecture_id { rand(2..48) }
    town { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { 10000000000 }
    user_id { 1 }
    item_id { 1 }
  end
end
