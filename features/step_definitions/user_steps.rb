World Warden::Test::Helpers
World Devise::TestHelpers
Warden.test_mode!

Given(/^I am logged in$/) do
  login_as User.first
end
