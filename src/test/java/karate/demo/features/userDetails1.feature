@ignore
Feature:  user Details

  Background:
    * def expectedOutput = read('../data/result.json')

    * def sleep =
    """
    function(seconds){
    for(i=0;i<seconds;i++)
    {
    java.lang.Thread.sleep(1*1000)
    }
    }
    """
    * url 'https://reqres.in/api/users'
  Scenario: request user2 details

    Given path 2
    And cookie date = 'new'
    When method GET
    Then status 200
    Then print "response for user2 =', response
   # Then match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/josephstein\/128.jpg"},"ad":{"company":"StatusCode Weekly","url":"http:\/\/statuscode.org\/","text":"A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."}}
    And match response == expectedOutput[0]
    And match response.data.id == 2
    And match response.data.last_name == 'Weaver'
    And match response.data.email == 'janet.weaver@reqres.in'
    And match response.data.avatar == 'https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg'
    And match response.ad.text == 'A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things.'
    And match response.ad.company != null
#  verify that a field is not present in the response
    * def job_code = response.job_code
#    And match job_code != null
    And match job_code == null
    * call sleep 10

  # @parallel=false
  Scenario: request user3 details
    Given path 3
    And cookie date = 'abc'
    When method GET
    Then status 200
    Then print "response for user3 =', response
    And match response == expectedOutput[1]
    And match response.data.id == 3
     * call sleep 10
