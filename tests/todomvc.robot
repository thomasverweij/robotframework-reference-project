*** Settings ***
Resource            ../resources/todomvc.resource

Suite Setup         New Browser    browser=%{BROWSER}    headless=%{HEADLESS}
Suite Teardown      Close Browser
Test Setup          New Context    viewport=%{VIEWPORT}
Test Teardown       Close Context


*** Test Cases ***
Add Two ToDos And Check Items
    [Documentation]    Checks if ToDos can be added and ToDo count increases
    [Tags]    add todo
    Given ToDo App Is Open
    When I Add A New ToDo "Learn Robot Framework"
    And I Add A New ToDo "Write Test Cases"
    Then Open ToDos Should Show "2 items left"

Add Two ToDos And Check Wrong Number Of Items
    [Documentation]    Checks if ToDos can be added and ToDo count increases
    [Tags]    add todo
    Given ToDo App Is Open
    When I Add A New ToDo "Learn Robot Framework"
    And I Add A New ToDo "Write Test Cases"
    Then Open ToDos Should Show "1 item left"

Add ToDo And Mark Same ToDo
    [Tags]    mark todo
    Given ToDo App Is Open
    When I Add A New ToDo "Learn Robot Framework"
    And I Mark ToDo "Learn Robot Framework"
    Then Open ToDos Should Show "0 items left"

Check If Marked ToDos are removed
    Given ToDo App Is Open
    And I Added Two ToDos
    When I Mark One ToDo
    Then Open ToDos Should Show "1 item left"

Split ToDos
    Given ToDo App Is Open
    When I Add New ToDos "Learn Robot Framework&Write Test Cases&Sleep"
    Then Open ToDos Should Show "3 items left"

Add A Lot Of Todos
    Given ToDo App Is Open
    When I Add "100" ToDos
    Then Open ToDos Should Show "100 items left"

Add A Lot Of Todos With WHILE
    Given ToDo App Is Open
    When I Add "100" ToDos With WHILE Loop
    Then Open ToDos Should Show "100 items left"
