@response_error_properties
Feature: Verify properties in error object 
  Check if the error object had the properties ‘details’ and ‘http_response_code’

  Scenario Outline:
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the error object had the properties <firstProperty> and <secondProperty>
  
  Examples:
    | endpoint                                             | firstProperty | secondProperty       |
    | https://testapi.io/api/RMSTest/ibltest/2023-09-11    | "details"     | "http_response_code" |