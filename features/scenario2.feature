@scenario2
Feature: Verify the “id” field, Verify “type” in “episode”
  Check if the “id” field is never null or empty(“”) for all 5 items present in the data array and check if the “type” in “episode” for every item is always “episode”

  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the “id” field is never "<value>" or empty(“”) for all items present in the data array
    Then the “type” in “episode” for every item is always <title>  

  Examples:
    | endpoint                                   | value | title       |
    | https://testapi.io/api/RMSTest/ibltest     | null  | "episode"   |
