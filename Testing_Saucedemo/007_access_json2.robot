*** Settings ***
Resource    001_resource.robot
Library     JSONLibrary
Library     OperatingSystem
Library     String

*** Variables ***
${json_file}            ./Data_Set/users.json
${COUNTER}              ${0}

*** Test Cases ***
Test 
    Json File

*** Keywords ***

Json File
    ${json_obj}=    Load JSON From File       ${json_file}
    ${json_str}=	Convert JSON To String	${json_obj}

    ${data}=  evaluate    json.loads('''${json_str}''')    json
    log to console      ${data["users"][0]["username"]}
