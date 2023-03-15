Feature: TEK Insurance API GET Service

  @getPrimaryAccount
  Scenario: Get Account API Test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * path "/api/accounts/get-primary-account"
    * param primaryPersonId = 5367
    * method get
    * print response
    * status 200
    * def responseID = response.id
    * match responseID == 5367
    * def responseEmail = response.email
    * match responseEmail == "james23456@gmail.com"
