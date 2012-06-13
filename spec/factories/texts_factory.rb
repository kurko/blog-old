FactoryGirl.define do
  factory :text do
    title "My text title"
    description "This is a description"
    content "This is the content"
    taxonomy

    trait :published do
      published true
    end

    trait :unpublished do
      published false
    end
  end
end
