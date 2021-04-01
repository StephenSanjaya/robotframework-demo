*** Settings ***
Library         SeleniumLibrary
Library         String
# asdasd
*** Test Cases ***
Test Json
    ${json_string}=    catenate
...            {
...                "firstName": "stephen",
...                "lastName" : "sanjaya",
...                "age"      : 20,
...                "address"  : [
...                     {
...                         "streetAddress": "Jl.apel",
...                         "city"         : {
...                                             "province": "Jakarta",
...                                             "region": "Jakarta Barat"
...                                          }
...                     },
...                     {
...                         "streetAddress": "Jl.pisang",
...                         "city"         : "bandung"
...                     }
...                 ]
...            }
    # log to console       \n\n${json_string}\n
    ${data}=  evaluate    json.loads('''${json_string}''')    json
    log to console       \n\n${data["address"][0]["city"]["region"]}\n