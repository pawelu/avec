# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) {|n| "Event #{n}" }

  factory :event do
    name { generate(:name) }
    address "Kraków"
    datetime_start "2013-12-31 23:59"
  end
end
