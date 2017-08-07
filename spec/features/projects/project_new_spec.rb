include Warden::Test::Helpers
Warden.test_mode!

# Feature: Project new
#   As a user
#   I want to create a new project
#   So I can work on the project details
feature 'Project new', :devise do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User creates new project
  #   Given I am signed in
  #   When I click the add project button
  #   And I add the new project details
  #   Then I see my new project
  scenario 'user creates new project' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:subject)
    FactoryGirl.create(:subject_other)
    FactoryGirl.create(:version)
    login_as(user, scope: :user)
    visit projects_path
    click_link 'Project'
    fill_in 'Name', with: 'My new project name'
    fill_in 'Description', with: 'My new project description'
    select 'My subject', from: 'Subject'
    select "v1 - effective #{1.year.ago.strftime('%m/%d/%Y')}", from: 'Version'
    click_button 'Add project'
    expect(page).to have_content('My new project name')
  end
end
