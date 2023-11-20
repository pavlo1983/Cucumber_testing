@id
Feature: Verify the “id” field
  Check if the “id” field is never null or empty(“”) for all 5 items present in the data array 

  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the “id” field is never "<value>" or empty(“”) for all items present in the data array

  Examples:
    | endpoint                                   | value | 
    | https://testapi.io/api/RMSTest/ibltest     | null  |
    
  