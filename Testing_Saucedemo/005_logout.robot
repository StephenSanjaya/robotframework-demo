*** Settings ***
Resource            001_resource.robot

*** Test Cases ***
Logout
    Click Burger Menu
    Click Logout
    Close Browser