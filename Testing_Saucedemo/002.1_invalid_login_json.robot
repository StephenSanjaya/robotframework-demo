*** Settings ***
Resource            001_resource.robot
Suite Setup         Json File
Library             JSONLibrary

*** Test Cases ***
Check Login For Invalid Crendential From Json File
    FOR    ${i}    IN RANGE     ${lengthOfData}
            Open Saucedemo Website
            Run Keyword And Continue On Failure
...         Login Template  ${data["users"][${i}]["username"]}  
...                         ${data["users"][${i}]["password"]}     
...                         ${data["users"][${i}]["error"]}
            Close Browser
    END

*** Keywords ***
Json File
    ${json_obj}=    Load JSON From File         ./Data_Set/users.json
    ${json_str}=	Convert JSON To String	    ${json_obj}

    ${data}=    evaluate        json.loads('''${json_str}''')    json
    ${lengthOfData}=  Get length      ${data["users"]}
    Set Global Variable         ${data}
    Set Global Variable         ${lengthOfData}
    
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