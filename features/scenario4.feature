@scenario4
Feature: Verify “live” field in “episode”
  Check that only one episode in the list has “live” field in “episode” as true

  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the only one episode in the list has "<broadcasting>" field in “episode” as true

  Examples:
    | endpoint                                   | broadcasting |
    | https://testapi.io/api/RMSTest/ibltest     | "live"       |