Feature: Verify response code and response time of the request
  Check if it is a 200 response code and response time below 1000 milliseconds
  
  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be <statusCode>
    Then the response time of the request is below <responseTime> milliseconds

  Examples:
    | endpoint                                   | statusCode | responseTime |
    | https://testapi.io/api/RMSTest/ibltest     | 200        | 1000         |
    
