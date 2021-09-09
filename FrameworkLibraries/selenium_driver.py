from robot.libraries.BuiltIn import BuiltIn
import time
import pandas as pd


def navigate_to_google():
    driver =BuiltIn().get_library_instance('SeleniumLibrary').driver
    driver.get("https://www.google.com")
    time.sleep(3)
    driver.get("https://www.seleniumeasy.com/test/")
        
def read_excel_row(TC_ID):
    td = pd.read_excel("D:\\AutomationTraining\\PyRobot\\TestData\\TestData_Check.xlsx", sheet_name="Sheet1",
                       index_col="TESTCASENAME", dtype=str)
    print(td.loc[TC_ID].to_dict()['SUB_REASON_VALUES'])
    return td.loc[TC_ID].to_dict()
  
read_excel_row("TC_1")