*** Settings ***
Documentation       Test and verify if login is invalid
Library             DataDriver      ../Data_Set/login_data.csv
# Library             DataDriver      ../Data_Set/login_data_excel.xlsx  Sheet_name=Sheet1
Resource            001_resource.robot
Test Setup          Open Saucedemo Website
Test Teardown       Run Keywords    Sleep Saucedemo Website     Close Browser
Test Template       Login Template

*** Test Cases ***
Check Login For Invalid Crendential    ${username}     ${password}     ${error}

*** Keywords ***
Sleep Saucedemo Website
    Sleep   1s

Login Template
    [Arguments]     ${username}     ${password}     ${error}
    Input Username      ${username}
    Input Password      ${password}
    Click Login Button
    Login Should Fail   ${error}

Login Should Fail
    [Arguments]     ${msg}    
    ${text}=            Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal     ${msg}      ${text}