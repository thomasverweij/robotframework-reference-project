*** Settings ***
Library     DatabaseLibrary


*** Test Cases ***
Connect To Database
    Connect To Database    sqlite    example.db

Create Table
    Execute Sql String    CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, email TEXT)

# Insert Data
#     [Arguments]    ${username}    ${email}
#     Execute Sql String    INSERT INTO users (username, email) VALUES ('${username}', '${email}')

# Get User Count
#     ${result}    Get Scalar    SELECT COUNT(*) FROM users
#     Should Be Equal As Integers    ${result}    1

# Get User By Username
#     [Arguments]    ${username}
#     @{user}    Query    SELECT * FROM users WHERE username='${username}'
#     Length Should Be    ${user}    1
#     Log Many    ${user}

# Delete User By Username
#     [Arguments]    ${username}
#     Execute Sql String    DELETE FROM users WHERE username='${username}'

# Get User Count After Deletion
#     ${result}    Get Scalar    SELECT COUNT(*) FROM users
#     Should Be Equal As Integers    ${result}    0
