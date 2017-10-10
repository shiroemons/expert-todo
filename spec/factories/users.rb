FactoryGirl.define do
  factory :user do
    email 'MyString'
    password 'Password'
    password_confirmation 'Password'
    crypted_password 'MyString'
    salt 'MyString'
  end
end
