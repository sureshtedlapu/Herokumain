Feature: Heroku main application
  Background:
    * def pageurl = 'https://id.heroku.com/login'
    * configure driver = { type: 'chrome', webDriverSession: { capabilities: { browserName: 'chrome' } } }
    Scenario: signup demo
      Given driver pageurl
      * delay(1000)
      * driver maximize()
      #* waitFor("//span[text()='Sign Up']")
      * retry(10).waitFor("//span[text()='Sign Up']")
      #And click("//span[text()='Sign Up']")
      * scroll("//span[text()='Sign Up']").click()
      * delay(1000)
      * scroll("//input[@id='first_name']").input('hello')
      #* input("//input[@id='first_name']",'jaya')
      * delay(1000)
      When input("//input[@id='last_name']",'metta')
      * input("//input[@id='email']",'jaya@gmail.com')
      * delay(2000)
      * input("//input[@id='company']",'mjorg')
      * delay(3000)
      * select("select[id='role']",'Hobbyist')
      * delay(1000)
      * select("select[id='self_declared_country']",'India')
      * delay(1000)
      * select("select[id='main_programming_language']",'Ruby')
      * match driver.title == 'Heroku | Sign up'



      @ignore
      Scenario: login demo by call read
        * driver pageurl
        * driver.maximize()
        * delay(1000)
        * call read('common/herokuLogin.feature')
