Feature:  Display grid to screen after a shot has been fired
          In order to see current situation
          As a player
          I want to see the grid

  Scenario: I want to see an empty grid before starting
  		Given I am on the Battleships page
  		When I send a hit to "A1"
      Then I should see the table

	Scenario: I want to see a 5x5 grid before starting
	    Given I am on the Battleships page
  		When I send a hit to "A1"
	    Then I should see the table
	    And the grid should have 5 rows
	    And the grid should have 5 columns

  Scenario: I want to see a hit in grid square "A1" when I fire at it and it has a ship
      Given I am on the Battleships page
      When I place ship in "A1"
      Given I am on the Battleships page
      When I send a hit to "A1"
      Then I want to see a "X" in grid square "A1"



