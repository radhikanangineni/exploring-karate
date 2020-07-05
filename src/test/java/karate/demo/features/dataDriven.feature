@ignore
Feature:  DataDrivenTest

  Background:
    * url 'http://dummy.restapiexample.com/'

  Scenario Outline: Create user Post method

    Given path 'api/v1/create'
    And request {"name":<name>,"salary":<salary>,"age":<age>}
    When method POST
    Then status 200
    Then print 'POST response data =',response
    Then print 'POST response ID =', response.data.id
    * def result = response

#    Given path 'api/v1/employee/'+ result.data.id
    Given path 'api/v1/employee/'+ 1
    When method GET
    Then status 200
    Then print 'GET response data =',response

    Examples:
      |read('../data/inputData.csv')|

