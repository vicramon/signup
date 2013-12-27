Feature: Create signup

  Scenario: Signed in user completes a signup
    Given I am signed in
    And I follow "Get Started"
    When I fill in the Basic Info
    And I click to continue
    And I fill in the Slots
    And I click to continue
    And I fill in the Form Fields
    And I click to continue
    And I fill in the People
    And I publish my signup
    Then I should see that my signup was published
