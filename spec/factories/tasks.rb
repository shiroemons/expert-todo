FactoryGirl.define do
  factory :task do
    title "MyString"
    content "MyText"
    expired_at "2017-10-09 20:11:17"
    user nil
  end
end
