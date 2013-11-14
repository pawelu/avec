# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) {|n| "Event #{n}" }

  factory :event do
    name { generate(:name) }
    description "Some description"
    date_start "2013-12-31"
    time_start "00:00"
    date_end "2014-01-01"
    time_end "23:59"
    capacity 3
  end
end
