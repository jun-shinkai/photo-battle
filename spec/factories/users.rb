FactoryBot.define do
  factory :user do
    name         {'test'}
    email        {Faker::Internet.free_email }
    password     {'00000qq'}
    password_confirmation {password}
    birthday     {'1999-08-29'}
  end
end
