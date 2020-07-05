
Feature:  user Details

  Background:
    * def expectedOutput = read('../data/result.json')
    * url url
  Scenario: request user2 details
#    Given url url
    Given path 2
    When method GET
    Then status 200
    Then print "response for user2 =', response
