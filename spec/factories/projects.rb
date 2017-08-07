FactoryGirl.define do
  factory :project do
    name 'My project'
    description 'My project'
    user_id 1
    subject_id 1
    version_id 1
    date Date.today
  
    factory :project_2 do
      name 'User 2 project'
      description 'user 2 project'
      user_id 2
    end
  end
end
