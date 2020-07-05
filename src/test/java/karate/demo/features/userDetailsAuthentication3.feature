@ignore
Feature: call to token generation feature

  Background:
    * def feature = call read('userDetailsAuthentication2.feature')
#  {email: 'eve.holt@reqres.in',password:'pistol'}
    Then print 'calling reading done'
    * def authToken = feature.accessToken

  Scenario: POST Test
    #   actual endpoint that needs the token/authorization is below, actual url is https://reqres.in/api/oauth2/token
#     When path 'https://reqres.in/api/users?page=2'
#      And header Authorization= 'Bearer' + accessToken
#    And request 'pass json payload'
#    And method POST
#    Then status 200
    Then print 'authToken is =', authToken