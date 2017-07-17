FactoryGirl.define do
  factory :project do
    name 'My project'
    description 'My project'
    user_id 1
  
    factory :project_2 do
      name 'User 2 project'
      description 'user 2 project'
      user_id 2
    end
  end
end
