import unittest
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time 
option = Options()

#close popup notification facebook
option.add_argument("--disable-infobars")
option.add_argument("--disable-notifications")
option.add_argument("--disable-extensions")
# Pass the argument 1 to allow and 2 to block
option.add_experimental_option("prefs", {
    "profile.default_content_setting_values.notifications": 2,
})


class LoginFacebook(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome(options=option)
        

    def testLogin(self):
        driver = self.driver
        driver.get("http://www.facebook.com")

        username = driver.find_element_by_xpath("//*[@id='email']")
        password = driver.find_element_by_xpath("//*[@id='pass']")
        login = driver.find_element_by_name('login')

        username.send_keys("Your Email")
        password.send_keys("Your Password")
        login.click()
        try:
            myElem = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, 'ssrb_root_start')))
            print("Page is ready!")
            assert True
        except TimeoutException:
            print("Loading took too much time!")
            assert False
        

        #function 'Watch Button'
        btn_watch = driver.find_element_by_xpath("//a[@href='/watch/']")
        btn_watch.click()
        time.sleep(3)
        assert True if 'Watch' in driver.page_source else False

        #function btn group
        btn_group = driver.find_element_by_xpath("//a[@href='/groups/']")
        btn_group.click()
        time.sleep(3)
        ##Preview all group
        assert True if driver.find_element_by_xpath("//div[@aria-label='Preview of a group']") else False

        #function 'btn notifications'
        btn_notification = driver.find_element_by_xpath("//div[@aria-label='Notifications'][@role='button']")
        btn_notification.click()
        time.sleep(3)
        assert True if driver.find_element_by_xpath("//div[@aria-label='Notifications'][@role='dialog']") else False
       
        #function 'btn account'
        btn_account = driver.find_element_by_xpath("//div[@aria-label='Account']")
        btn_account.click()
        time.sleep(1)
        btn_logout = driver.find_element_by_xpath("//span[contains(text(), 'Log Out')]")
        btn_logout.click()
        time.sleep(3)
        assert True if username and password else False


if __name__ == "__main__":
    unittest.main()
