@ignore

Feature:  user Details

  Background:
    * def expectedOutput = read('../data/result.json')
    * def result = call read('userDetails1.feature')

  Scenario: request user4 details
    Given url 'https://reqres.in/api/users/4'
    When method GET
    Then status 200
    Then print response
    And match response == expectedOutput[2]
    And match response.data.id == 4
    Then print 'result is =', result
    * def responseStatus = result.response.data.first_name
    * def responseCookies = result.responseCookies
    * def requestTimeStamp = result.requestTimeStamp
    * def responseTime = result.responseTime
    * def responseHeaders = result.responseHeaders
    * def contentType = responseHeaders['Content-Type'][0]
    * def uploadStatusCode = responseStatus

    * print 'responseCookies is=', responseCookies
    * print 'requestTimeStamp is=', requestTimeStamp
    * print 'responseTime is=', responseTime
    * print 'responseHeaders is=', responseHeaders
    * print 'contentType is=', contentType
    * print 'uploadStatusCode is=', uploadStatusCode
#    Then assert responseStatus == 200