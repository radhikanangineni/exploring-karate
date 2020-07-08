
Feature: Create multiple users

  @CreateMultipleUsers
  Scenario Outline: Create User Test for <user>
    * def inputRequest = read ('../data/createUserRequest_<user>.json')
    * set inputRequest.name = <name>
    * set inputRequest.salary = <salary>
    * set inputRequest.age = <age>

    Given url urlForRegistration
    And request inputRequest
    When method POST
    Then status 200
    And match response.status == 'success'
    And match response.data.name == <name>
    And match response.data.salary == <salary>
    And match response.data.age == <age>

    Examples:
      |user|name|salary|age|
     |eve|'testuser1'|  5000    |20|
      |eve1|'testuser2'|  10000     |30|
