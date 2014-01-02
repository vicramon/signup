Feature: Fields

  Scenario: User adds form fields
    Given I am signed in
    And I have a signup
    When I add custom form fields
    Then I should see those form fields
