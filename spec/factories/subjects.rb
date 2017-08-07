FactoryGirl.define do
  factory :subject do
    name 'My subject'
    description 'My subject'

    factory :subject_other do
      name 'My other subject'
      description 'My other subject'
    end
  end
end
