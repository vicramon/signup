Feature: Signup

  Scenario: User signs up for slot
    Given there is a published signup form
    When I visit that signup form
    And I click on a slot
    And I fill out the signup form
    Then I should be signed up for that slot
