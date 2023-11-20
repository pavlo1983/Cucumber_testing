@response_time
Feature: Verify response time of the request
  Check if it is a response time below 1000 milliseconds
  
  Scenario Outline: 
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the response time of the request is below <responseTime> milliseconds

  Examples:
    | endpoint                                   | responseTime |
    | https://testapi.io/api/RMSTest/ibltest     | 1000         |