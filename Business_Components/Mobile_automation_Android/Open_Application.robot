*** Settings ***
Library    AppiumLibrary

*** Variables ***
${app_activity}     chat21.android.demo.SplashActivity
${app_package}      chat21.android.demo
${app_activity1}    com.solodroid.solomerce.activities.ActivitySplash
${app_package1}     com.solodroid.solomerce


*** Keywords ***

Open The Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554	    appPackage=${app_package}    appActivity=${app_activity}    automationName=uiautomator2


Open Chrome Browser
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554     browserName=Chrome


Open The E-Commerce Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554	    appPackage=${app_package1}    appActivity=${app_activity1}    automationName=uiautomator2