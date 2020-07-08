@ignore
Feature: API Authentication

  Background:
 # base url
    * url 'https://reqres.in/api/users/1'
#    * def params =
#    """
#    {
#    'email' : '#(email)',
#    'password' : '#(password)'
#    }
#    """
  Scenario: Authentication Test
##     access token url below, actual url is https://reqres.in/api/oauth2/token
#      When path 'oauth2/token'
#      And form field grant_type = 'client_credentials'
#      And form fields params
#      When method POST
#      Then status 200
#    When method GET
#    Then print response
    * def response = {"access_token" : "test the token is passed to main api"}
    * def accessToken = response.access_token
    * print "This is a simple message"
    * print "accessToken is = ",accessToken

# #   actual endpoint that needs the credentials is below, actual url is https://reqres.in/api/oauth2/token
#     When path 'register'
#      And header Authorization= 'Bearer' + accessToken