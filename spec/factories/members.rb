include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :member do
    sequence(:first_name) {|x| "John#{x}"}
    last_name "Smith"
    role "Member"
    sequence(:email) {|y| "test#{y}@email.com"}
    gender "Male"
    photo_url { fixture_file_upload("spec/file_fixtures/bg1.jpg", "image/jpeg") }
    # sequence(:photo_url) {|z|"photo#{z}.jpg"}
  end
end

    # trait :male do
    #   first_name   "John"
    #   last_name "Smith"
    #   gender "Male"
    # end

    # trait :female do
    #   first_name  "Jane"
    #   last_name "Doe"
    #   gender "Female"
    # end

    # factory :member_male,   traits: [:male]
    # factory :member_female, traits: [:female]

    # trait :student do
    #   first_name   "John"
    #   last_name "Smith"
    #   role "Admin"
    # end

    # trait :staff do
    #   first_name  "Jane"
    #   last_name "Doe"
    #   role "Admin"
    # end

    # factory :member_student,   traits: [:student]
    # factory :member_staff,   traits: [:staff]

