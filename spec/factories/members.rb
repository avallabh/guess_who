# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    first_name "John"
    last_name "Smith"
    role "Member"
    sequence(:email) {|x| "test#{x}@email.com"}
    gender "Male"

    trait :male do
      first_name   "John"
      last_name "Smith"
      gender "Male"
    end

    trait :female do
      first_name  "Jane"
      last_name "Doe"
      gender "Female"
    end

    factory :member_male,   traits: [:male]
    factory :member_female, traits: [:female]

    trait :student do
      first_name   "John"
      last_name "Smith"
      role "Admin"
    end

    trait :staff do
      first_name  "Jane"
      last_name "Doe"
      role "Admin"
    end

    factory :member_student,   traits: [:student]
    factory :member_staff,   traits: [:staff]
  end
end
