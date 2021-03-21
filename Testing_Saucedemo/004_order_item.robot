*** Settings ***
Documentation       Purchasing an item from inventory page
Resource            001_resource.robot

*** Test Cases ***
Adding The Most Expensive item To Cart
    Filter From Higher Price To Low
    Click Add To Cart Button

Checkout Cart
    Click Cart Icon
    Click Checkout Button

Input Valid Information
    Input First Name            ${FIRST NAME}
    Input Last Name             ${LAST NAME}
    Input Postal Code Name      ${POSTAL CODE}
    Click Continue To Purchase item
    CLick Finish Button

Verify If Checkout Success
    Checkout Complete Page Should Be Open


