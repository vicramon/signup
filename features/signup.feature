Feature: Signup

  Scenario: User signs up for event with slots
    Given there is a published signup form with slots
    And that signup form has slots
    When I visit that signup form
    And I click on a slot
    And I fill out the signup form
    Then I should be signed up for that event
    And I should be signed up for that slot

  Scenario: User signs up for event with no slots
    Given there is a published signup form
    When I visit that signup form
    And I follow "Signup"
    And I fill out the signup form
    Then I should be signed up for that event

  Scenario: User can't signup twice
    Given there is a published signup form
    And I am already signed up for that event
    When I visit that signup form
    And I follow "Signup"
    And I fill out the signup form
    Then I should see a notice that I am already signed up

  Scenario: User fills out custom fields
    Given there is a published signup form
    And that signup form has custom fields
    When I visit that signup form
    And I follow "Signup"
    And I fill out the signup form and custom fields
    Then I should be signed up for that event
    And my custom field info should be saved

  @javascript @pending
  Scenario: Required custom fields are required
    Given there is a published signup form
    And that signup form has custom fields
    When I visit that signup form
    And I follow "Signup"
    And I fill out the signup form but not the custom fields
    Then I should see a javascript validation error
