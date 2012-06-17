FactoryGirl.define do
  factory :admin_user, class: AdminUser do
    email "admin@example.com"
    password "123456"
  end
end
