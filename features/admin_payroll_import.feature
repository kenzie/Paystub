Feature: Administrator Payroll Import
  In order to manage their payroll distribution
  the finance department
  wants to import this week's payroll data

  Background:
    Given I have an account with email "jane.doe@zutphen.ca" and password "secret"
    And I am signed in as "jane.doe@zutphen.ca" with password "secret"

  Scenario: Import
    Given I am on the new payroll page
    And I attach the file "test/fixtures/payroll_example.xml" to "Data"
    And I press "Create Payroll"
    Then I should see "Created new payroll for Zutphen Construction"
    And I should see "2011-09-17"
    # And I should see "4 Paystubs"
    # And I should see "John Doe"
    # And I should see "John Smith"
    # And I should see "John Cameron"
    # And I should see "John Graham"
