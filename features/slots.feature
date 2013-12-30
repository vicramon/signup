Feature: Slots

  Scenario: User creates slots
    Given I am signed in
    And I have a signup
    When I go to the slots page
    And I add slots
    Then I should see those slots

  Scenario: User deletes slots
    Given I am signed in
    And I have a signup with slots
    When I go to the slots page
    And I delete a slot
    Then I should not see that slot
