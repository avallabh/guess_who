# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    value "http://github.com/john"
    end
  end
  #   member nil

  #   trait :github do
  #     value "john"
  #   end

  #   trait :linkedin do
  #     key "linkedin"
  #     value "john"
  #   end

  #   trait :twitter do
  #     key "twitter"
  #     value "john"
  #     #
  #   end

  #   trait :hometown do
  #     key "hometown"
  #     value "Boston, MA"
  #   end

  #   trait :interests do
  #     key "interests"
  #     value "cats"
  #   end

  #   factory :github, traits:[:github]
  #   factory :linkedin, traits:[:linkedin]
  #   factory :twitter, traits:[:twitter]
  #   factory :hometown, traits:[:hometown]
  #   factory :interests, traits:[:interests]
  # end

