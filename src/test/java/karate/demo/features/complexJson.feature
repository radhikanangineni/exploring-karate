@ComplexJson
Feature: Complex Json

  Background:
    * def ResponseJson = read ('../data/complexJsonResponse.json')
    Scenario:
#    * match ResponseJson.kittens[*].id == [23, 42, 53]
#      * match ResponseJson.kittens[*].id contains 23
#      * match ResponseJson.kittens[*].id contains [42, 23]
#      * match ResponseJson.kittens[*].id contains only [23, 53, 42]
#      * match ResponseJson.kittens[*].salary contains 10000
##      * match ResponseJson.kittens[*].id !contains [53]
#      * match ResponseJson.kittens[*].id contains any [53, 60,70]
##      * match ResponseJson.kittens[*].id contains any [80, 60,70]
#      * match ResponseJson..name contains any ['Billie', 'Bob', 'Wild' ]
#      * match ResponseJson.kittens[*].name contains any ['Bob', 'Wild' ]
      * match each ResponseJson.kittens contains {id : '#number' , name : '#string'}
      * match each ResponseJson.kittens contains {id : '#notnull', name : '#regex [A-Z][a-z]+'}
      * match each ResponseJson.kittens contains {id : '#present', name : '#ignore'}
      * def isLessThanSixty = function(x) { return x<60 }
      * match each ResponseJson.kittens contains { id : '#? isLessThanSixty(_)' }
      * def part = { "id" : 23 }
      * match ResponseJson contains '#(^part)'