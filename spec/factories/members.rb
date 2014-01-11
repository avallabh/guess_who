# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    first_name "John"
    last_name "Smith"
    role "student"
    sequence(:email) {|x| "test#{x}@email.com"}
    gender "male"

    trait :male do
      first_name   "John"
      last_name "Smith"
      gender "male"
    end

    trait :female do
      first_name  "Jane"
      last_name "Doe"
      gender "female"
    end

    factory :member_male,   traits: [:male]
    factory :member_female, traits: [:female]

    trait :student do
      first_name   "John"
      last_name "Smith"
      role "student"
    end

    trait :staff do
      first_name  "Jane"
      last_name "Doe"
      role "staff"
    end

    factory :member_student,   traits: [:student]
    factory :member_staff,   traits: [:staff]
  end
end
