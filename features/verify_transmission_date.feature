@transmission
Feature: Verify the “transmission_start” date and “transmission_end” date 
  Check that the “transmission_start” date value is before the “transmission_end” date

  Scenario Outline:
    Given I have an API endpoint "<endpoint>"
    When I send a GET request
    Then the “transmission_start” date value is before the “transmission_end” date
  
  Examples:
    | endpoint                                   | 
    | https://testapi.io/api/RMSTest/ibltest     | 
    