FactoryGirl.define do
  factory :task do
    sequence(:title) { |n| "test_#{n}" }
    content 'MyText'
    expired_at { Time.zone.now }
    user
  end
end
