*** Settings ***
Library           MongoDBLibrary

*** Variables ***
${SEQ}            1    # Test variable

*** Keywords ***
Add Replay Rest Data
    [Arguments]    ${apiName}    ${actionName}    ${expectValue}    ${responseMsg}    ${customData}=${EMPTY}
    MongoDBLibrary.Save Mongodb Records    ReplayData    replayRestData    { \ \ \ \ "className" : "com.qahive.replaydata.model.RestReplayDataModel", \ \ \ \ "seq" : "${SEQ}", \ \ \ \ "isReplay" : false, \ \ \ \ "apiName" : "${apiName}", \ \ \ \ "actionName" : "${actionName}", \ \ \ \ "expectValue" : "${expectValue}", \ \ \ \ "responseMsg" : "${responseMsg}", \ \ \ \ "customData" : "${customData}" }
    ${SEQ} =     Evaluate    ${SEQ} + 1
    Set Test Variable    ${SEQ}

Connect to Replay Rest Data DB
    MongoDBLibrary.Connect To Mongodb

Disconnect from Replay Rest Data DB
    MongoDBLibrary.Disconnect From Mongodb

Clean up test Replay Rest Data
    MongoDBLibrary.Drop Mongodb Collection    ReplayData    replayRestData

Update Replay Rest Data
    [Arguments]    ${seq}    ${update json data}
    ${QueryJSON}    Set Variable    {"seq" : "${seq}" }
    ${UpdateJSON}    Set Variable    {"$set": ${update json data}}
    &{allResults}    MongoDBLibrary.Retrieve And Update One Mongodb Record    ReplayData    replayRestData    ${QueryJSON}    ${UpdateJSON}
    LOG    ${allResults}
