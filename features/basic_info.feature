Feature: Create signup with basic info

  Scenario: Signed in user creates a signup
    Given I am signed in
    And I go to create a new signup
    When I fill in the Basic Info
    And I click to continue
    Then I should see that my signup is saved as a draft
