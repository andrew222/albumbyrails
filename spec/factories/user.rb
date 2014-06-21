# spec/factories/contacts.rb
FactoryGirl.define do
  factory :user do |u|
    u.email { Faker::Internet.email }
    u.name { Faker::Name.name }
    u.password { Faker::Name.name }
  end

  factory :invalid_user, parent: :user do |u|
	  u.email nil
	end


end

