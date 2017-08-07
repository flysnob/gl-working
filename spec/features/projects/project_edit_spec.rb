include Warden::Test::Helpers
Warden.test_mode!

# Feature: Project edit
#   As a user
#   I want to edit my project
#   So I can change my project details
feature 'Project edit', :devise do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User changes project name
  #   Given I am signed in
  #   When I change my project name
  #   Then I see a project update change
  scenario 'user changes project name' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    project = FactoryGirl.create(:project)
    FactoryGirl.create(:subject)
    FactoryGirl.create(:version)
    visit edit_project_path(project)
    fill_in 'Name', with: 'My new project name'
    fill_in 'Description', with: 'My new project description'
    select 'My subject', from: 'Subject'
    select "v1 - effective #{1.year.ago.strftime('%m/%d/%Y')}", from: 'Version'
    click_button 'Save'
    expect(page).to have_content('Project "My new project name" successfully updated')
  end
end
