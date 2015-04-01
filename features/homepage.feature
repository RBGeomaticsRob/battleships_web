Feature: send a hit and receive a hit or miss
		In order to receive 'hit' or 'miss'
		As a player
		I want to send a string

		Scenario: send a hit and receive a hit or miss
				Given I am on the Battleships page
				When I enter "Rob"
        And I click the submit button
				Then I should see "Player 1 = Rob"