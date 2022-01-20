FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    item_name              {Faker::Name.initials(number: 3)}
    content                {Faker::Lorem.sentence}
    category_id            {2}
    condition_id           {2}
    delivery_id            {2}
    area_id                {2}
    scheduled_id           {2}
    price                  {Faker::Number.within(range: 300..9999999)}
    user_id                {1}
  end
end