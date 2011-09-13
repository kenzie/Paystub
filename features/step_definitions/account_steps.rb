Given /^I have an account with email "([^"]*)" and password "([^"]*)"$/ do |email, pass|
  User.create(:name => 'John Doe', :email => email, :password => pass)
end