Given /^I am signed in as "([^"]*)" with password "([^"]*)"$/ do |email, pass|
  Given "I am on the sign in page"
  And "I fill in \"Email\" with \"#{email}\""
  And "I fill in \"Password\" with \"#{pass}\""
  And "I press \"Sign In\""
end