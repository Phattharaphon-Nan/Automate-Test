import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class LoginFacebook(unittest.TestCase):

    def setUp(self) :
        self.driver = webdriver.Chrome()
        

    def testLogin(self) :
        driver = self.driver
        driver.get("http://www.facebook.com")

        username = driver.find_element_by_xpath("//*[@id='email']")
        password = driver.find_element_by_xpath("//*[@id='pass']")
        login = driver.find_element_by_name('login')

        username.send_keys("p_nan29@hotmail.com")
        password.send_keys("phattharaphon_28244")
        login.click()
    
    
    
    
if __name__ == "__main__":
    unittest.main()

        