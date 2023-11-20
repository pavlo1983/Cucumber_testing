Feature: Verify that the “title” field in “episode”
  Check that the “title” field in “episode”, is never null or empty(“”) for any schedule item

  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the “title” field in “episode”, is never "<value>" or empty(“”) for any schedule item
    
  Examples:
    | endpoint                                   | value |
    | https://testapi.io/api/RMSTest/ibltest     | null  |
    