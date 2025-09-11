Feature: Edit Existing Prompt
 
   Scenario: TC05 - Edit Existing Prompt
     # Preconditions: User is logged in and prompt exists
     When I open 'https://nexus.elitea.ai' url
     Then I type "alita@elitea.ai" to "EliteaLoginPage -> usernameInput"
     Then I type "rokziJ-nuvzo4-hucmih" to "EliteaLoginPage -> passwordInput"
     Then I click "EliteaLoginPage -> signInBtn"
     Then I expect 'EliteaMainPage -> avatar' to be visible
     And I click "EliteaMainPage -> projectSelector"
     And I click "EliteaMainPage -> privateProjectListItem"
 
     # Test Steps
     And I click "EliteaMainPage -> menuButton"
     And I click "EliteaMainPage -> promptMenuItem"
     And I click "EliteaPromptsPage -> existingPrompt"
     And I click "EliteaPromptsPage -> editPromptButton"
     Then I type "Updated Test Context" to "EliteaEditPromptPage -> contextTextarea"
     And I click "EliteaEditPromptPage -> saveButton"
 
     # Expected Results
     Then I expect 'EliteaEditPromptPage -> versionDropdown' to be visible
     Then I expect 'EliteaEditPromptPage -> saveButton' to be not clickable
     Then I expect 'EliteaEditPromptPage -> runTab' to be visible