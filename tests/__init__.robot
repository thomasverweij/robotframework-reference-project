*** Settings ***
Library         dotenv

Suite Setup     Load Environment Variables


*** Keywords ***
Load Environment Variables
    ${envfile}      Get Variable Value      $envfile    default=.env
    Load Dotenv     ${envfile}
