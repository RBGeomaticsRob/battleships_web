Feature: send a hit and receive a hit or miss
    In order to receive 'hit' or 'miss'
    As a player
    I want to send a string

    Scenario: send a hit and receive a hit or miss
        Given I am on the Battleships page
        When I send a hit to "A1"
        Then I should see "A1"

    Scenario: send a hit and receive a collision error
        Given I am on the Battleships page
        Given I already have ship in "A1"
        Given I am on the Battleships page
        When I place ship in "A1"
        Then I should see 'error page'
