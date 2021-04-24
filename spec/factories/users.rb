FactoryBot.define do
  factory :user do

    # インスタンスを生成
    japanese_user = Gimei.name

  
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {Faker::Internet.password(min_length: 6)}
    last_name             {japanese_user.first.kanji}
    last_name_kana        {japanese_user.first.katakana}
    first_name            {japanese_user.last.kanji}
    first_name_kana       {japanese_user.last.katakana}
    birthday              { Faker::Date.between(from: "1930-01-01",to: "2000-01-01")} 
  end
end