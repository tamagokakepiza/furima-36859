FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    area_id { 2 }
    address { '港区' }
    municipality { '三軒茶屋' }
    room_number { '1-1' }
    phone_number { '12345678999' }
    association :user
    association :item
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
