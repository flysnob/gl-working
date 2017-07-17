Feature: View Projects
  As a user
  I want to view a list of my projects
  Because I need to see all of my available projects

  Scenario: No projects
    Given I am a user
    When I view the list of projects
    Then I should see no projects

  Scenario: With projects
    Given I am a user
    And I have projects
    When I view the list of projects
    Then I should see my projects
