@date
Feature: Verify the “Date” value 
  Check the “Date” value in the response headers

  Scenario Outline:
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the response headers, verify the “Date” value in range of <range> milliseconds
  
  Examples:
    | endpoint                                   | range |
    | https://testapi.io/api/RMSTest/ibltest     | 1500  |
    