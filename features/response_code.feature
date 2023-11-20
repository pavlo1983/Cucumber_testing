@response_code
Feature: Verify response code of the request
  Check if it is a 200 response code 
  
  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be <statusCode>


  Examples:
    | endpoint                                   | statusCode | 
    | https://testapi.io/api/RMSTest/ibltest     | 200        |
    
