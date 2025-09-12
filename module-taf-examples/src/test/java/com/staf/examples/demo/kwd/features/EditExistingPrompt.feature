Feature: Edit Existing Prompt

  Background:
    Given I open 'https://nexus.elitea.ai' url
    Then I type 'alita@elitea.ai' to 'EliteaLoginPage -> usernameInput'
    Then I type 'rokziJ-nuvzo4-hucmih' to 'EliteaLoginPage -> passwordInput'
    Then I click 'EliteaLoginPage -> signInBtn'
    Then I expect 'EliteaMainPage -> avatar' to be visible
    Then I expect 'EliteaMainPage -> projectSelector' to be clickable
    And I click 'EliteaMainPage -> projectSelector'
    And I wait 3 seconds
    And I click 'EliteaMainPage -> privateProjectListItem'

  Scenario: TC05
    Given I click 'EliteaMainPage -> menuButton'
    And I click 'EliteaMainPage -> promptMenuItem'
    When I click 'TestPrompt1' text in 'EliteaPromptsPage -> promptCards' collection
    And I click 'EliteaEditPromptPage -> configurationTab'
    Then I type 'Updated Test Context' to 'EliteaEditPromptPage -> contextTextarea'
    And I click 'EliteaEditPromptPage -> saveButton'
    Then I expect 'EliteaEditPromptPage -> alertMessage' to be visible