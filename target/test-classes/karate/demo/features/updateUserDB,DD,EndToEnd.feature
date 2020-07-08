@UpdateUser
Feature: Update User

  Background:
    # use jdbc to validate

    * def config = { username: 'root', password: 'password', url: 'jdbc:mysql://localhost:3306/mydb?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC', driverClassName: 'com.mysql.cj.jdbc.Driver' }
    * def DbUtils = Java.type('karate.demo.utils.DbUtils')
    * def db = new DbUtils(config)


  Scenario Outline: Update User Test  for user <userName> with id <userId>

    * def name = db.readValue('select username from User where id=<userId>')
    * def job = db.readValue('select role from User where id=<userId>')
    Then print 'name from db', name
    Then print 'job from db', job

    # Parameterize the Input json
    * def inputRequest = read ('../data/updateUserRequest_<userName>.json')
    * set inputRequest.name = name
    * set inputRequest.job = job

    Given url updateUserUrl+<userId>
    And request inputRequest
    When method PUT
    Then status 200
    And match response == read('../data/responseSchema.json')
    And match response.name == name
    And match response.job == job

    * def getDate =
      """
      function() {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var sdf = new SimpleDateFormat('MM/dd/yyyy');
        var date = new java.util.Date();
        return sdf.format(date);
      }
      """
    * def temp = getDate()
    * print 'system date=', temp

    Examples:
    |userName|userId|
    |kiran|1|
    |nithya|2|