*** Settings ***
Library         DatabaseLibrary
Resource        001_resource.robot
Suite Setup     Run Keywords  Connect To Database     pymysql      ${db_name}  ${db_user}  
...             ${db_pasword}   ${db_host}  ${db_port}   AND  Fetch Data  AND  Row Count In Users Table
Suite Teardown  Disconnect From Database

*** Variables ***
${db_name}          db_test
${db_user}          root
${db_pasword}       
${db_host}          127.0.0.1
${db_port}          3306

*** Test Cases ***
Check Login For Invalid Crendential From Database
    FOR    ${i}    IN RANGE     ${lengthOfData}
            Open Saucedemo Website
            Run Keyword And Continue On Failure
...         Login Template  ${queryResults[${i}][0]}
...                         ${queryResults[${i}][1]}     
...                         ${queryResults[${i}][2]}
            Close Browser
    END
    
*** Keywords ***
Create Users Table
    Execute SQL String    CREATE TABLE users (id integer primary key,username varchar(50),password varchar(50), error varchar(50));

Insert Multiple Data Into Users Table
    Execute SQL Script    ./Data_Set/users_data.sql

Fetch Data
    ${queryResults}	        Query	    select username, password, error from users
    Set Global Variable     ${queryResults}

Row Count In Users Table
    ${lengthOfData}	            Row Count	select * from users
    Set Global Variable     ${lengthOfData}

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
