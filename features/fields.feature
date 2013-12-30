Feature: Fields

  Scenario: User adds form fields
    Given I am signed in
    When I add custom form fields
    Then I should see those form fields
