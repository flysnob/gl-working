include Warden::Test::Helpers
Warden.test_mode!
# Feature: Project index page
#   As a user
#   I want to see a list of my projects
#   So I can see all of my projects
feature 'Project index page', :devise do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Project listed on index page
  #   Given I am signed in
  #   When I visit the project index page
  #   Then I see my project named 'My Project'
  scenario 'user sees a project' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    project = FactoryGirl.create(:project)
    visit projects_path
    expect(page).to have_content 'My project'
  end

  # Scenario: Project not listed on index page
  #   Given I am signed in
  #   When I visit the project index page
  #   Then I should not see another user's project
  scenario 'user does not see another user project' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    project = FactoryGirl.create(:project)
    project_2 = FactoryGirl.create(:project_2)
    visit projects_path
    expect(page).to have_content project.name
    expect(page).to_not have_content project_2.name
  end
end
