import os.path

ROBOT_LISTENER_API_VERSION = 2
ROBOT_LIBRARY_SCOPE = "GLOBAL"



def close():
     os.system("allure generate ..//..//Report//allure -o ..//..//Report//allure-report --clean")
     os.system("allure open ..//..//Report//allure-report")
     print('All tests executed')



# robot -r ../Report/report.html -o ../Report/output.xml -l ../Report/log.html SeleniumEasyDataDriver.robot
# robot --listener allure_robotframework --listener Python_Listener ./SeleniumEasyDataDriver.robot
# allure generate ../../Report/allure -o ../../Report/allure-report --clean
# allure open .
# pabot

# robot --outputdir ../../Report --listener allure_robotframework;../../Report/allure --listener ../../FrameworkLibraries/Python_Listener.py TC_002_allure_report.robot

