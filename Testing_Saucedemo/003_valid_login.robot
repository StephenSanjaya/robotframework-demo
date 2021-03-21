*** Settings ***
Documentation   verify login in saucedemo website 
Resource        001_resource.robot

*** Test Cases ***
Check Login for valid Crendential
    Open Saucedemo Website
    Input Username                  ${VALID_USERNAME}
    Input Password                  ${VALID_PASSWORD}
    Click Login Button
    Inventory Page Should Be Open
