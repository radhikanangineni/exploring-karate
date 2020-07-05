#@ignore
Feature: API Authentication

  Background:
    * url 'https://reqres.in/api/register'

  Scenario: Authentication Test
    Given path 'token'
    And form field grant_type = clientCredentials
    And form field client_id = ''
    And form field client_secret = ''
    When method POST
    Then status 201
    * print "clientCredentials is ="+clientCredentials
    * def accessToken = response.access_Token

##      Pass to another API call
#    Given path 'pass url'
#    And headers Authentication='Bearer'+accessToken
#    When Method GET
#    Then status 200