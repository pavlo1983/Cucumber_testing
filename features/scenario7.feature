@scenario7
Feature: Verify status response code and verify properties in error object 
  Check that the HTTP status code of the response is 404 and check if the error object had the properties ‘details’ and ‘http_response_code’

  Scenario Outline:
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the HTTP status code of the response is <statusCode>
    Then the error object had the properties <firstProperty> and <secondProperty>
  
  Examples:
    | endpoint                                             | statusCode | firstProperty | secondProperty       |
    | https://testapi.io/api/RMSTest/ibltest/2023-09-11    | 404        | "details"     | "http_response_code" |
  