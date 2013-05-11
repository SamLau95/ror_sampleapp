FactoryGirl.define do
  factory :user do
    name     'Sam Lau'
    email    'samlau95@gmail.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end