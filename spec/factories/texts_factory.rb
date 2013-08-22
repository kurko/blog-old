FactoryGirl.define do
  factory :text, class: Text::Persistence do
    title "My text title"
    description "This is a description"
    content "This is the content"
    association :taxonomy

    trait :published do
      published true
    end

    trait :unpublished do
      published false
    end
  end
end
