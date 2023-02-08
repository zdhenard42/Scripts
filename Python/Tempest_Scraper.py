import undetected_chromedriver as uc
from undetected_chromedriver.options import ChromeOptions
from selenium.webdriver.common.by import By
import time

def main():
    myoptions = ChromeOptions()
    #myoptions.add_argument("--headless")
    driver = uc.Chrome(options=myoptions)
    #driver = uc.Chrome
    
    urltoSignInPage = 'https://tempestwx.com/station/12345/grid'
    driver.get(urltoSignInPage)
    time.sleep(3)
    while (True): 
        timestr = time.strftime("%Y%m%d-%H%M%S")
        f = open('./data/%s.txt' % timestr, "w")
        print("made here")
        List = (driver.find_element(By.XPATH, "/html/body").text).splitlines()
        for i in range(len(List)):
            f.write(str(i)+ " " + List[i] + "\n")
        f.close()
        time.sleep(30)
    
main()
