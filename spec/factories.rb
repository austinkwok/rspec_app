FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.sequence(:email) { |n| "#{n}-p@example.com" }
    f.password { "foobar" } 
    f.password_confirmation { "foobar" }
  end
end