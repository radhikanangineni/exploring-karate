@ignore
Feature:  Create user Details

  Background:
    * def inputPayload = read('../data/requestpayload.json')
    * url 'https://reqres.in/api/users'
# ----Use either headers or configure to pass headers both worked
  # Website https://devqa.io/set-multiple-headers-http-request-karate/
    # https://github.com/intuit/karate/blob/master/karate-demo/src/test/java/demo/headers/headers.feature
  #    * headers {Content-Type : 'Application/json', Accept : 'application/json'}
#    * configure headers = {Content-Type: 'Application/json', Accept : 'application/json', Connection : 'Keep-Alive'}
#   https://semaphoreci.com/community/tutorials/testing-a-java-spring-boot-rest-api-with-karate
  #  In case authorization token need to be passed pass like below
    * header Authorization = 'xyz'
    * param delay = 3
#  Passing multiple parameters  * params {delay = 3, param2 = '', param3 = }
  Scenario: Create user Post method

    And request inputPayload
    When method POST
    Then status 201
    Then print 'response data =',response