Feature: Dashboard

  Scenario: User views list of signups
    Given I am signed in
    And I have created signups
    When I visit the dashboard
    Then I should see those signups
