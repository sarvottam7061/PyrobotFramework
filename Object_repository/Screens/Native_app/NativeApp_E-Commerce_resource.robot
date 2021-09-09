*** Settings ***
Library    AppiumLibrary
Resource    ../../../Business_Components/Mobile_automation_Android/Open_Application.robot

*** Variables ***
${category_head}    id=com.solodroid.solomerce:id/nav_category
${search_icon}    id=com.solodroid.solomerce:id/search
${text_to_search}    id=com.solodroid.solomerce:id/search_src_text
${searched_product_unique}    id=com.solodroid.solomerce:id/product_name
${cancel_search}    id=com.solodroid.solomerce:id/search_close_btn
${collapse_search_button}    //android.widget.ImageButton[@content-desc='Collapse']
${electronicsandgadgets_icon}    //android.widget.TextView[@text='Electronics & Gadgets']
#${selecting_tv}    //android.widget.TextView[@text='LED TV 43 Inch Smart TV TCL 43E3 UHD 4K Dolby Sound']
${selecting_item}    id=com.solodroid.solomerce:id/category_image
${add_to_cart}    //android.widget.Button[@text='ADD TO CART']
${No_of_order_input}    id=com.solodroid.solomerce:id/userInputDialog
${Add_order_button}    //android.widget.Button[@text='ADD']
${Go_to_cart}    id=com.solodroid.solomerce:id/cart
${checkout_button}    //android.widget.Button[@text='CHECKOUT']
${Process_checkout_button}    //android.widget.Button[@text='PROCESS CHECKOUT']
${Confirm_order_yes_button}    //android.widget.Button[@text='YES']

*** Keywords ***
Open the E-Commerce App
    Open The E-Commerce Application
    wait until element is visible    ${category_head}    timeout=15

Click on the search button and do a manual search
    [Arguments]    ${Item_name}
    click element    ${search_icon}
    wait until element is visible    ${text_to_search}
    input text    ${text_to_search}    ${Item_name}
    wait until element is visible    ${searched_product_unique}

Cancel the manual search and collapse the search bar
    click element    ${cancel_search}
    click element    ${collapse_search_button}
    wait until element is visible    ${category_head}

Navigate to the categories tab
    click element    ${category_head}
    wait until element is visible    ${electronicsandgadgets_icon}    timeout=15

Navigate to a particular category
    click element    ${electronicsandgadgets_icon}
    wait until page contains   Samsung    timeout=15

Select a particular item from the list of items
#    click element    ${selecting_item}
    click text    Samsung Galaxy
    wait until page contains    Lorem    timeout=15

Adding the selected item and number of item to the cart
    [Arguments]    ${no_of_order}
    click element    ${add_to_cart}
    wait until element is visible    ${no_of_order_input}    timeout=15
    input text    ${no_of_order_input}    ${no_of_order}
    click element    ${Add_order_button}
    wait until page contains    Lorem    timeout=15

Navigate to the cart to check about added items
    click element    ${Go_to_cart}
    wait until element is visible    ${checkout_button}    timeout=15

Steps for order checkout
    click element    ${checkout_button}
    wait until element is visible    ${process_checkout_button}    timeout=15
    click element    ${process_checkout_button}
    wait until element is visible    ${confirm_order_yes_button}    timeout=15

Place an order
    click element    ${confirm_order_yes_button}

To start screen recording
    start screen recording
To stop screen recording
    stop screen recording

To take page screenshot
    [Arguments]   ${ss_no}
    Capture Page Screenshot    filename=${ss_no}.png


