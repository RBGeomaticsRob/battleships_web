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

    Scenario: the game is won when all ships are sunk
        Given I am on the Battleships page
        And I already have ship in "A1"
        Given I am on the Battleships page
        When I send a hit to "A1"
        Given I am on the Battleships page
        And I send a hit to "A2"
        Given I am on the Battleships page
        And I send a hit to "A3"
        Given I am on the Battleships page
        Then I should see "game won? true"

