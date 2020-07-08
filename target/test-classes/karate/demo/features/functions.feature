@ignore
Feature:  functions

  Background:
    * def expectedOutput = read('../data/result.json')


  Scenario: request user4 details
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
#    Then print response
    * def data = response.data
    * def fun = function() { return "hello"}
    * def data1 = call fun
    Then print "data is=", data1

    * def users =
  """
  function(arg) {
  for(i=0; i<arg.length; i++){
  if(arg[i].id == 9) {
   var test = 'this is sample print';
   karate.log(test);
   print (test)
   return arg[i];

  }
  }
  }
  """
   # return arg.length
    * def userDetails = call users data
    Then print "user details is=", userDetails

    * def variable =
  """
  function() {
    var num = 1;

    return num;
  }
  """
    * def vari = call variable
   Then print "variable is=", vari
