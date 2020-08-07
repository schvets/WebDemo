*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         practice.automationtesting.in
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     jimok@webmails.top
${VALID PASSWORD}    5@J5@4QmjuxqPAz
${LOGIN URL}      http://${SERVER}/my-account/
${PRODUCT PAGE}   http://${SERVER}/product/
${PRODUCT CODE}   /html5-webapp-develpment
${SHOPPING CART}   http://${SERVER}/basket/
${PAYMENT METHOD}   Direct Bank Transfer

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Open browser to product page
    [Arguments]    ${productId}
    ${productpage}  Catenate    ${PRODUCT PAGE}  ${productId}
    Go To    ${productpage}


Place order
    Wait Until Element Is Visible    payment_method_bacs    10
    Wait Until Page Does Not Contain Element    //div[@class='blockUI blockOverlay']    15
    Click Element    payment_method_bacs
    Click Element    place_order
    Title Should Be    Checkout – Automation Practice Site

Open browser to shopping cart page
    Go To    ${SHOPPING CART}
    Shopping cart page Should Be Open

Login Page Should Be Open
    Title Should Be    My Account – Automation Practice Site

Shopping cart page Should Be Open
    Title Should Be    Basket – Automation Practice Site

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Navigate to Checkout page
    Click Link    http://practice.automationtesting.in/checkout/
    Title Should Be    Checkout – Automation Practice Site

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Login

Add product to cart
    Click Element    //button[@class='single_add_to_cart_button button alt']

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
