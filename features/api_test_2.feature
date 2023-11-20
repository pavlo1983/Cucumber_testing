Feature: Verify the “id” field and “type” in “episode”
  Check if the “id” field is never null or empty(“”) for all 5 items present in the data array and verify that the “type” in “episode” for every item is always “episode”

  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the “id” field is never "<value>" or empty(“”) for all items present in the data array
    Then the “type” in “episode” for every item is always <title>  

  Examples:
    | endpoint                                   | value | title       |
    | https://testapi.io/api/RMSTest/ibltest     | null  | "episode"   |
    
  