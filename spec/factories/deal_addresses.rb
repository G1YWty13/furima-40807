FactoryBot.define do
  factory :deal_address do
    housenumber { '123-4567' }
    prefecture_id { rand(2..48) }
    town { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { 10_000_000_000 }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
