FactoryBot.define do
  factory :user do
    # インスタンスを生成
    japanese_user = Gimei.name

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "1q1q1q" }
    password_confirmation { password }
    last_name             { japanese_user.first.kanji }
    last_name_kana        { japanese_user.first.katakana }
    first_name            { japanese_user.last.kanji }
    first_name_kana       { japanese_user.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2000-01-01') }
  end
end
