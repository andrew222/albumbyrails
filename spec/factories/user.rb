# spec/factories/contacts.rb
FactoryGirl.define do
  factory :user do |u|
    # u.email "qqerqqer@126.com"
    # u.name "andrew"
    # u.password "amdrew"
    u.email { Faker::Internet.email }
    u.name { Faker::Name.name }
    u.password { Faker::Name.name }
  end
end

