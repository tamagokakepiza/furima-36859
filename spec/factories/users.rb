FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.free_email }
    password              { Faker::Lorem.characters(min_alpha: 1, min_numeric: 1, number: 6) }
    password_confirmation { password }
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    transient do
      person { Gimei.name }
    end
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_day { Faker::Date.backward }
  end
end
