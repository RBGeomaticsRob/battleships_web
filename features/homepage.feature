Feature: send a hit and receive a hit or miss
		In order to receive 'hit' or 'miss'
		As a player
		I want to send a string

		Scenario: send a hit and receive a hit or miss
				Given a user is on Battleships page
				When they send "string"
				Then they receive a hit 