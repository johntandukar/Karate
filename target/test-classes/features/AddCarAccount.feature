Feature: TEK Insurance API Post Service

  @car
  Scenario: Add car service test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * def primaryPerson = call read("PostAccount.feature")
    * def id = primaryPerson.response.id
    * param primaryPersonId = id
    * path "/api/accounts/add-account-car"
    * request
      """
      {
      
      "make": "BatMobile",
      "model": "NightRider",
      "year": "2099",
      "licensePlate": "BAT"
      }
      """
    * method post
    * print response
