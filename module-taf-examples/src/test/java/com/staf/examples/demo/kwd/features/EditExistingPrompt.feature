Feature: Edit Existing Prompt

  Scenario: TC05
    # Open Elitea application
    When I open 'https://nexus.elitea.ai' url
    # Log in with username and password
    Then I type 'alita@elitea.ai' to 'EliteaLoginPage -> usernameInput'
    Then I type 'rokziJ-nuvzo4-hucmih' to 'EliteaLoginPage -> passwordInput'
    Then I click 'EliteaLoginPage -> signInBtn'
    # Verify user avatar is visible
    Then I expect 'EliteaMainPage -> avatar' to be visible
    And I wait 5 seconds
    # Switch to the Private project
    And I click 'EliteaMainPage -> projectSelector'
    And I wait 3 seconds
    And I click 'EliteaMainPage -> privateProjectListItem'
    Then I expect 'EliteaMainPage -> menuButton' to be clickable
    # Navigate to the Prompts menu
    And I click 'EliteaMainPage -> menuButton'
    And I click 'EliteaMainPage -> promptMenuItem'
    # Select an existing prompt by title
    When I click "TestPrompt1" text in "EliteaPromptsPage -> promptCards" collection
    # Edit the Context field
    And I wait 5 seconds
    And I click 'EliteaEditPromptPage -> configurationTab'
    Then I expect 'EliteaEditPromptPage -> contextTextarea' to be visible
    Then I type 'Updated Test Context' to 'EliteaEditPromptPage -> contextTextarea'
    # Save the changes
    And I click 'EliteaEditPromptPage -> saveButton'
    # Verify the success message is displayed
    Then I expect 'EliteaEditPromptPage -> alertMessage' to be visible