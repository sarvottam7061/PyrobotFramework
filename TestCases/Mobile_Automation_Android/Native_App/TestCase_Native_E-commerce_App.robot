*** Settings ***
Library    AppiumLibrary
Resource    ../../../Object_repository/Screens/Native_app/NativeApp_E-Commerce_resource.robot
Suite Setup    Open the E-Commerce App
Suite Teardown    Place an order

*** Variables ***
${Item_name}    Samsung
${order_quantity}    2

*** Test Cases ***



TC_01_To do a manual search
    To start screen recording
    click on the search button and do a manual search    ${Item_name}
    To take page screenshot    E-Com_01

TC_02_Cancel the manual search
    cancel the manual search and collapse the search bar
    To take page screenshot    E-Com_02

TC_03_Navigate to categories
    Navigate to the categories tab
    To take page screenshot    E-Com_03

TC_04_Navigate to a partiular category and select an item
    navigate to a particular category
    To take page screenshot    E-Com_04
    select a particular item from the list of items
    To take page screenshot    E-Com_05

TC_05_Add selected item to the cart
    adding the selected item and number of item to the cart    ${order_quantity}
    To take page screenshot    E-Com_06

TC_06_Chechout details
    navigate to the cart to check about added items
    To take page screenshot    E-Com_07

TC_07_Order Checkout
    steps for order checkout
    To take page screenshot    E-Com_08
    stop screen recording
