Feature: View Versions
  As a user
  I want to view a list of available versions
  Because I need to select a version applicable to my subject effective date

  Scenario: No versions
    Given I am a user
    When I view the list of versions
    Then I should see no versions

  Scenario: With versions
    Given I am a user
    And I have versions
    When I view the list of versions
    Then I should see my versions
