Feature: Create signup with basic info

  Scenario: Signed in user creates a signup
    Given I am signed in
    And I go to create a new signup
    When I fill in the Basic Info
    And I click to continue
    Then I should see that my signup is saved as a draft

  # Scenario: Full process
  #   And I fill in the Slots
  #   And I click to continue
  #   And I fill in the Form Fields
  #   And I click to continue
  #   And I fill in the People
  #   And I publish my signup
  #   Then I should see that my signup was published
