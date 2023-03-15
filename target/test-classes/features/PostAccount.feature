Feature: TEK Insurance API Post Request

  @post
  Scenario: Post Primary Account SErvice Test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * path "/api/accounts/add-primary-account"
    * def generator = Java.type("test.api.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def title = generator.getTitle()
    * def dateOfBirth = generator.getDOB()
    * def gender = generator.getGender()
    * def employmentStatus = generator.getEmploymentStatus()
    * def maritalStatus = generator.getMaritalStatus()
    * request
      """
      {
      "email": "#(email)",
      "firstName": "#(firstName)",
      "lastName": "#(lastname)",
      "title": "#(title)",
      "gender": "#(gender)",
      "maritalStatus": "#(maritalStatus)",
      "employmentStatus": "#(employmentStatus)",
      "dateOfBirth": "#(dateOfBirth)",
      "new": true
      }
      """
    * method post
    * status 201
    * print response
