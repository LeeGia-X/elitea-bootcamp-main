Feature: Edit Existing Prompt

  Scenario: TC05 - Edit Existing Prompt
    # Step 1: Open the Elitea application
    When I open "https://nexus.elitea.ai" url

    # Step 2: Log in with valid credentials
    Then I type "alita@elitea.ai" to "EliteaLoginPage -> usernameInput"
    Then I type "rokziJ-nuvzo4-hucmih" to "EliteaLoginPage -> passwordInput"
    Then I click "EliteaLoginPage -> signInBtn"

    # Step 3: Verify user avatar is visible
    Then I expect "EliteaMainPage -> avatar" to be visible

    # Step 4: Switch to the Private project
    And I click "EliteaMainPage -> projectSelector"
    And I click "EliteaMainPage -> privateProjectListItem"

    # Step 5: Navigate to the Prompts menu
    And I click "EliteaMainPage -> menuButton"
    And I click "EliteaMainPage -> promptMenuItem"

    # Step 6: Select an existing prompt
    And I click "EliteaPromptsPage -> promptCards[0]"

    # Step 7: Edit the Context field
    Then I type "Updated Test Context" to "EliteaEditPromptPage -> contextTextarea"

    # Step 8: Save the changes
    And I click "EliteaEditPromptPage -> saveButton"

    # Step 9: Verify success message and updated context
    Then I expect "EliteaEditPromptPage -> alertMessage" to be visible
    Then I expect "EliteaEditPromptPage -> contextTextarea" has text value "Updated Test Context"