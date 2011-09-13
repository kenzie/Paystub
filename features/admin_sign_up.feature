Feature: Administrator Sign Up
  In order to manage their payroll distribution
  the finance department
  wants to create an account
  
  Scenario: Register new account
    Given I am on the new user page
    When I fill in "Name" with "Jane Doe"
    And I fill in "Email" with "jane.doe@zutphen.ca"
    And I fill in "Password" with "secret"
    And I press "Create Account"
    Then I should see "Created new account for Jane Doe"
