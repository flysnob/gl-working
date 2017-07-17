include Warden::Test::Helpers
Warden.test_mode!

# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'Project show page', :devise do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees own project
  #   Given I am signed in
  #   When I visit the project show page
  #   Then I see my own project
  scenario 'user sees project details' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    user = FactoryGirl.create(:project)
    visit project_path(project)
    expect(page).to have_content project.name
    expect(page).to have_content project.description
  end
end
