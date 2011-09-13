Feature: Administrator Session
  In order to manage their payroll distribution
  the finance department
  wants to sign in to their account

  Background:
    Given I have an account with email "jane.doe@zutphen.ca" and password "secret"

  Scenario: Sign in
    Given I am on the sign in page
    And I fill in "Email" with "jane.doe@zutphen.ca"
    And I fill in "Password" with "secret"
    And I press "Sign In"
    Then I should see "Signed in!"
