Feature: Notes
  Scenario: Create, view and then update a note
    Given I am logged in
    And I am on the notes page
    Then there should be 0 notes

    Given I click "New Note"
    And I fill in the note title with "Hello, World"
    And I fill in the note content with "This is a note"
    And I click "Create Note"
    Then there should be 1 note
    And I should be on the note page for "Hello, World"

    Given I fill in the note content with "This is an updated note"
    And I click "Update Note"
    Then the content of note "Hello, World" should be "This is an updated note"
    And I should be on the note page for "Hello, World"

  Scenario: Use the JSON API to list all notes
    Given I am logged in
    And I have a note called "Hello, World"
    And I am on the notes page, requesting JSON
    Then I should see a note called "Hello, World"
  
  Scenario: Use the JSON API to view a note
    Given I am logged in
    And I have a note called "Hello, World"
    And I am on the note page for "Hello, World", requesting JSON
    Then I should see a note called "Hello, World"
