FactoryGirl.define do
  factory :user do |u|
    u.username 'dude'
    u.display_name 'Dude'
    u.status false
  end
end