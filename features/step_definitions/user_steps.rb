Given(/^I am a user$/) do
  @user = FactoryGirl.create(:user)
  login_as @user
end
