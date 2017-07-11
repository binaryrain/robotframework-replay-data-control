*** Settings ***
Suite Setup       Connect to Replay Rest Data DB
Suite Teardown    Disconnect from Replay Rest Data DB
Test Teardown     Clean up test Replay Rest Data
Resource          ../src/RestReplayDataService.robot

*** Test Cases ***
should be able to add replay rest data
    Add Replay Rest Data    Products    GET    ID-1    Product-1
    Add Replay Rest Data    Products    GET    \    Products
    Update Replay Rest Data    2    {"expectValue":"ID-2"}

should be able to add replay rest data 2
    Add Replay Rest Data    Products    GET    ID-1    Product-1
    Add Replay Rest Data    Products    GET    \    Products
