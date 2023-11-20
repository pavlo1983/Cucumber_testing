@type_episode
Feature: Verify “type” in “episode”
  Check if the “type” in “episode” for every item is always “episode”

  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the “type” in “episode” for every item is always <title>  

  Examples:
    | endpoint                                   | title       |
    | https://testapi.io/api/RMSTest/ibltest     | "episode"   |