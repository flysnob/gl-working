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
  #   Then I see a project update message
  scenario 'user changes project name' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    project = FactoryGirl.create(:project)
    visit edit_project_path(project)
    fill_in 'Name', with: 'My new project name'
    fill_in 'Description', with: 'My new project description'
    click_button 'Update'
    txts = [I18n.t('devise.registrations.updated'), I18n.t('devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end
end
