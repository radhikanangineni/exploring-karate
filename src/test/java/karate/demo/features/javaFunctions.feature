@ignore
Feature:  Java Functions

  Background:
    * def expectedOutput = read('../data/result.json')

#  Scenario Outline: call java methods and request user4 details
  Scenario: call java methods and request user4 details

    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
#    Then print response
    * def data = response.data
    Then print 'Output Dat: ', data
    * def users =
          """
            function(arg) {
              for(i=0; i<arg.length; i++){
                if(arg[i].id == 9) {
                  return arg[i].email;
                }
              }
            }
          """
    * def buildListOfObjects =
          """
            function(inputData) {
              print('in buildObject function..');
              var listOfObjects = [];
              for(i=0; i < inputData.length; i++){
                var outputObject = new Object();
                outputObject.id = inputData[i].id;
                outputObject.email = inputData[i].email;
                outputObject.firstName = inputData[i].first_name;
                outputObject.lastName = inputData[i].last_name;
                outputObject.avatar = inputData[i].avatar;
                listOfObjects.push(outputObject);
              }
              return listOfObjects
            }
            """
    * def listOfObjects = call buildListOfObjects data
    Then print 'buildListOfObjects: ', listOfObjects
    * def outputFile = Java.type('karate.demo.features.WriteData')
    * outputFile.writeListOfObjects(listOfObjects)


#    * json attr = data
#    Then print 'attr: ', attr
#    * def className = 'karate.demo.features.ModelKarate'
#    * def testPojo = karate.toBean(data[0], className)
#    * def testKiran = match each data.foo == { bar: '#number', baz: '#string' }
#    Then print 'testPojo: ', testPojo

    * def email = call users data
    Then print 'user details is=', email
#    * def outputFile = Java.type('karate.demo.features.WriteData')
    * def result = outputFile.writeData(email)

#    * def javaDemo = Java.type('karate.demo.features.javaFunctions')
#    * def ns = new javaDemo().nonstaticMethod(" Non Static Method")
#    * def s = javaDemo.staticMethod(" Static Method")
#
#    * match ns contains <arg1>
#    * match s contains <arg2>
#    Examples:
#      | arg1 | arg2|
#    |'Non Static Method'| 'Static Method'|
