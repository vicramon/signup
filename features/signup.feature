Feature: Signup

  Scenario: User signs up for event with slots
    Given there is a published signup form with slots
    When I visit that signup form
    And I click on a slot
    And I fill out the signup form
    Then I should be signed up for that event
    And I should be signed up for that slot

  Scenario: User signs up for event with no slots
    Given there is a published signup form with no slots
    When I visit that signup form
    And I follow "Signup"
    And I fill out the signup form
    Then I should be signed up for that event

  Scenario: User can't signup twice
    Given there is a published signup form with no slots
    And I am already signed up for that event
    When I visit that signup form
    And I follow "Signup"
    And I fill out the signup form
    Then I should see a notice that I am already signed up
