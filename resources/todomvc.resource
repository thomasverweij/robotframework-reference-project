*** Settings ***
Library     Browser
Library     String


*** Keywords ***
ToDo App Is Open
    New Page    %{TODOMVC_URL}

I Add A New ToDo "${todo}"
    Fill Text       .new-todo       ${todo}
    Press Keys      .new-todo       Enter

I Add New ToDos "${todo}"
    IF    "&" in $todo
        @{todos}        Split String    ${todo}     separator=&
        FOR    ${item}    IN    @{todos}
            Fill Text       .new-todo       ${item}
            Press Keys      .new-todo       Enter
        END
    ELSE
        Fill Text       .new-todo       ${todo}
        Press Keys      .new-todo       Enter
    END

Open ToDos Should Show "${text}"
    ${actual}       Get Text    span.todo-count
    Should Be Equal As Strings                      ${actual}           ${text}             ignore_case=True

I Mark ToDo "${todo}"
    Click       "${todo}" >> .. >> input.toggle

I Added Two ToDos
    I Add A New ToDo "Learn Robot Framework"
    I Add A New ToDo "Write Test Cases"

I Mark One ToDo
    Click       li:first-child >> input.toggle

I Add "${count}" ToDos
    FOR    ${index}    IN RANGE    ${count}
        I Add A New ToDo "My ToDo Number ${index}"
    END

I Add "${count}" ToDos With WHILE Loop
    ${x}    Set Variable    ${0}
    WHILE    ${x} < ${count}
        ${x}    Evaluate    ${x} + 1
        I Add A New ToDo "My ToDo Number ${x}"
    END
