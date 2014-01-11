# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member_information do
    key "github"
    value "John"
    member nil

    trait :github do
      key "github"
      value "john"
    end

    trait :linkedin do
      key "linkedin"
      value "john"
    end

    trait :twitter do
      key "twitter"
      value "john"
      #
    end

    trait :hometown do
      key "hometown"
      value "Boston, MA"
    end

    trait :interests do
      key "interests"
      value "cats"
    end

    factory :member_info_github, traits:[:github]
    factory :member_info_linkedin, traits:[:linkedin]
    factory :member_info_twitter, traits:[:twitter]
    factory :member_info_hometown, traits:[:hometown]
    factory :member_info_interests, traits:[:interests]
  end
end
