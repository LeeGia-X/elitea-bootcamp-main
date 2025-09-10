Feature: Edit Existing Prompt
  As a user
  I want to edit an existing prompt
  So that I can update its context
 
  Scenario: Edit the context of an existing prompt
    Given I am logged in
    When I open "https://nexus.elitea.ai" url
    And I type "alita@elitea.ai" to "EliteaLoginPage -> usernameInput"
    And I type "rokziJ-nuvzo4-hucmih" to "EliteaLoginPage -> passwordInput"
    And I click "EliteaLoginPage -> signInBtn"
    Then I expect "EliteaMainPage -> avatar" to be visible
    When I navigate to the Prompts menu
    And I select the prompt with name "TestPrompt1"
    And I click "Edit"
    And I type "Updated Test Context" to "Context"
    And I click "Save"
    Then I expect "Prompt updated successfully" to be visible
