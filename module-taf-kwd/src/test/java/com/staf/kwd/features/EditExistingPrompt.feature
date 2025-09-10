Feature: Edit Existing Prompt
  As a user
  I want to edit an existing prompt
  So that I can update its context

  Scenario: Edit the context of an existing prompt
    Given I am logged in
    And a prompt named "TestPrompt1" exists
    When I navigate to the Prompts menu
    And I select the prompt named "TestPrompt1"
    And I click "Edit" button
    And I type "Updated Test Context" to "Context" field
    And I click "Save" button
    Then I expect "Success message" to be visible
    And the prompt context is updated to "Updated Test Context"
