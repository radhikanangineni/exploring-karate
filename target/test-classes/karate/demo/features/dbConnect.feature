@ConnectToMysql
Feature: Connect to mysql

  Background:
    # use jdbc to validate
    * def config = { username: 'root', password: 'password', url: 'jdbc:mysql://localhost:3306/mydb?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC', driverClassName: 'com.mysql.cj.jdbc.Driver' }
    * def DbUtils = Java.type('karate.demo.utils.DbUtils')
    * def db = new DbUtils(config)

  Scenario Outline: mysql test
    * def course = db.readRows('select * from course')
    Then print 'Courses list is =',courses

    * def UpdateUser = db.UpdateRow('UPDATE Jpa_user SET id = <id> WHERE id=200')
    Then print 'Jpa_user list is =',db.readRows('select * from Jpa_user')

    * def DeleteUsers = db.UpdateRow('DELETE from Jpa_user WHERE id=520')
    Then print 'Jpa_user list is =',db.readRows('select * from Jpa_user')

    Examples:
    |id|
      | 4 |