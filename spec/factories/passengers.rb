FactoryGirl.define do
  factory :passenger do
    line_user_id "MyString"
    first_name "MyString"
    last_name "MyString"
    mobile "MyString"
    primary_address "MyString"
    secondary_address "MyString"
    is_vip false
    is_active true
    note "MyString"
  end
end
