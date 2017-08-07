include Warden::Test::Helpers
Warden.test_mode!
# Feature: Project work page
#   As a user
#   I want to answer questions related to my project's subject
#   So I can get to the correct accounting answer
feature 'Project work page', :devise do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Project work page
  #   Given I am signed in
  #   And I visit the project index page
  #   And I select a project to work
  #   Then I see my project's work page
  scenario 'user sees project work page' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    FactoryGirl.create(:version_1)
    FactoryGirl.create(:version_2)
    FactoryGirl.create(:subject)
    FactoryGirl.create(:question_1_1)
    visit projects_path
    click_link 'Project'
    fill_in 'Name', with: 'My new project name'
    fill_in 'Description', with: 'My new project description'
    fill_in 'Date', with: Date.today.strftime('%m/%d/%Y')
    select 'My subject', from: 'Subject'
    select "v1 - effective #{1.year.ago.strftime('%m/%d/%Y')}", from: 'Version'
    click_button 'Add project'
    click 
    project = FactoryGirl.create(:project)
    visit work_project_path(project)
    expect(page).to have_content('Process')
  end

  # Scenario: Project work page
  #   Given I am signed in
  #   And I visit the project index page
  #   And I select a project to work
  #   And I have no responses
  #   Then I see my project's initial queston
  scenario 'user sees initial node' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    FactoryGirl.create(:version_1)
    FactoryGirl.create(:version_2)                                                                                                                                                                          
    FactoryGirl.create(:version_3)
    FactoryGirl.create(:subject)
    FactoryGirl.create(:question_1_1)
    FactoryGirl.create(:question_1_2)
    FactoryGirl.create(:question_1_3)
    FactoryGirl.create(:question_1_4)
    FactoryGirl.create(:question_1_5)
    FactoryGirl.create(:question_1_6)
    FactoryGirl.create(:question_2_1)
    FactoryGirl.create(:question_2_2)
    FactoryGirl.create(:question_2_3)
    FactoryGirl.create(:question_2_4)
    FactoryGirl.create(:question_2_5)
    FactoryGirl.create(:question_2_6)
    project = FactoryGirl.create(:project)
    visit work_project_path(project)
    expect(page).to have_content('Current node ID: 1-1')
    expect(page).to have_content('Current index: 1')
  end  
end
