Feature: Edit Existing Prompt
   As a user
   I want to edit an existing prompt
   So that I can update its context field
 
   Background:
     Given I open "https://nexus.elitea.ai" url
     And I type "alita@elitea.ai" to "EliteaLoginPage -> usernameInput"
     And I type "rokziJ-nuvzo4-hucmih" to "EliteaLoginPage -> passwordInput"
     And I click "EliteaLoginPage -> signInBtn"
     And I click "EliteaMainPage -> projectSelector"
     And I click "EliteaMainPage -> privateProjectListItem"
     Then I expect "EliteaMainPage -> avatar" to be visible
     And I wait 5 seconds
     And I click "EliteaMainPage -> projectSelector"
     And I click "EliteaMainPage -> privateProjectListItem"
 
   Scenario: Successfully edit an existing prompt   
     Given I click "EliteaMainPage -> menuButton"
     And I click "EliteaMainPage -> promptMenuItem"
     And I select "TestPrompt1" from "EliteaPromptsPage -> promptCards"
     And I click "EliteaEditPromptPage -> configurationTab"
     And I type "Updated Test Context" to "EliteaEditPromptPage -> contextTextarea"
     When I click "EliteaEditPromptPage -> saveButton"
     Then I expect "EliteaEditPromptPage -> alertMessage" has text value "Prompt updated successfully"
