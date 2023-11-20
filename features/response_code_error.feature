@response_error_code
Feature: Verify status response code 
  Check that the HTTP status code of the response is 404 

  Scenario Outline:
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the HTTP status code of the response is <statusCode>
  
  Examples:
    | endpoint                                             | statusCode | 
    | https://testapi.io/api/RMSTest/ibltest/2023-09-11    | 404        | 
    