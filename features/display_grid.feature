Feature:  Display grid to screen after a shot has been fired
          In order to see current situation
          As a player
          I want to see the grid

    Scenario: I want to see an empty grid before starting
        Given I am on the Battleships page
        Then I should see the table

	Scenario: I want to see a 5x5 grid before starting
	    Given I am on the Battleships page
	    Then I should see the table
	    And the grid should have 5 rows
	    And the grid should have 5 columns

