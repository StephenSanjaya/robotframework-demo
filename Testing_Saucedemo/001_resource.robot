*** Settings ***
Documentation       Testing website saucedemo from login untill purchasing an item
Library             SeleniumLibrary     run_on_failure=Nothing

*** Variables ***
${SERVER}   www.saucedemo.com
${URL}      https://${SERVER}/
${BROWSER}  chrome
${VALID_USERNAME}   standard_user
${VALID_PASSWORD}   secret_sauce
${FIRST NAME}       Stephen
${LAST NAME}        Sanjaya
${POSTAL CODE}      11270
${INVENTORY PAGE}   https://${SERVER}/inventory.html

*** Keywords ***
Open Saucedemo Website
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window

Input Username
    [Arguments]     ${username}
    Input Text          //*[@id="user-name"]    ${username}

Input Password
    [Arguments]     ${password}
    Input Text          //*[@id="password"]    ${password}

Click Login Button
    Click Button    //*[@id="login-button"]

Inventory Page Should Be Open
    Location Should Be              ${INVENTORY PAGE}
    Element Should Be Visible       //*[@id="inventory_container"]/div/div[1]/div[1]

Filter From Higher Price To Low
    Select From List By Value      //*[@id="inventory_filter_container"]/Select   hilo

Click Add To Cart Button
    Click Button            //*[@id="inventory_container"]/div/div[1]/div[3]/button

Click Cart Icon
    Click Element           //*[@id="shopping_cart_container"]/a

Click Checkout Button
    Click Element            //*[@id="cart_contents_container"]/div/div[2]/a[2]

Input First Name
    [Arguments]     ${first_name}
    Input Text          //*[@id="first-name"]   ${first_name}

Input Last Name
    [Arguments]     ${last_name}
    Input Text          //*[@id="last-name"]   ${last_name}

Input Postal Code Name
    [Arguments]     ${postal_code}
    Input Text          //*[@id="postal-code"]   ${postal_code}

Click Continue To Purchase item
    Click Button        //*[@id="checkout_info_container"]/div/form/div[2]/input

CLick Finish Button
    Click Element       //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

Checkout Complete Page Should Be Open
    Location Should Be      https://www.saucedemo.com/checkout-complete.html

Click Burger Menu
    Click Button        //*[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible       //*[@id="logout_sidebar_link"]

Click Logout
    # Sleep                   5s
    Click Element          //*[@id="logout_sidebar_link"]
    Location Should Be      ${URL}