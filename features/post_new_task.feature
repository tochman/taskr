Feature: Post New task
  As a visitor or user,
  In order to post a task request,
  I should see a link/button on the index page that provides a form.

  Background:
    Given the task categories exist
      | name                |
      | Plumbing            |
      | Electrical          |
      | Computer            |
      | Carpenting          |
      | Cleaning            |

    And the following requester accounts exist
      | email             | first_name | last_name | password | password_confirmation |
      | requester@ab.com  | Re         | Quester   | 12345678 | 12345678              |

  Scenario: Post task when user is not yet logged in
    Given I visit the landing page
    And I click on "Post new task"
    And I fill in field "Task Name" with "Broken Sink"
    And I fill in field "Description" with "Clogged Sink"
    And I select "Plumbing" from "Task Category"
    And I fill in field "Minimum Budget($):" with "100"
    And I fill in field "Maximum Budget($):" with "500"
    And I fill in field "Location" with "Clogged Sink"
    And I click on "Submit"
    And I fill in field "Email" with "requester@ab.com"
    And I fill in field "Password" with "12345678"
    And I click on "Log In"
    Then I should see "Task was successfully posted!"

    Scenario: Post task if user is logged in already
      Given I visit the landing page
      And I click on "Requester Log In"
      And I fill in field "Email" with "requester@ab.com"
      And I fill in field "Password" with "12345678"
      And I click on "Log In"
      And I click on "Post new task"
      And I fill in field "Task Name" with "Broken Sink"
      And I fill in field "Description" with "Clogged Sink"
      And I select "Plumbing" from "Task Category"
      And I fill in field "Minimum Budget($):" with "100"
      And I fill in field "Maximum Budget($):" with "500"
      And I fill in field "Location" with "Clogged Sink"
      And I click on "Submit"
      Then I should see "Task was successfully posted!"
