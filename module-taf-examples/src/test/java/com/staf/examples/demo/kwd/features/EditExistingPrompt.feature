Feature: Edit Existing Prompt

  Background:
    Given I open 'https://nexus.elitea.ai' url
    Then I type 'alita@elitea.ai' to 'EliteaLoginPage -> usernameInput'
    Then I type 'rokziJ-nuvzo4-hucmih' to 'EliteaLoginPage -> passwordInput'
    Then I click 'EliteaLoginPage -> signInBtn'
    Then I expect 'EliteaMainPage -> avatar' to be visible
    And I click 'EliteaMainPage -> projectSelector'
    And I click 'EliteaMainPage -> privateProjectListItem'

  Scenario: TC05
    And I click 'EliteaMainPage -> menuButton'
    And I click 'EliteaMainPage -> promptMenuItem'
    And I click 'EliteaPromptsPage -> existingPrompt'
    And I click 'EliteaPromptsPage -> editPromptButton'
    Then I type 'Updated Test Context' to 'EliteaEditPromptPage -> contextTextarea'
    And I click 'EliteaEditPromptPage -> saveButton'
    Then I expect 'EliteaEditPromptPage -> successMessage' to be visible