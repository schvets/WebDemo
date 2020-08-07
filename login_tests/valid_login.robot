*** Settings ***
Documentation     A test suite with a single test for valid login and place order.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Browser is opened to login page
    Open browser to login page

User "${VALID USER}" logs in with password "${VALID PASSWORD}"
    Input username    ${VALID USER}
    Input password    ${VALID PASSWORD}
    Submit credentials
    Login Page Should Be Open

Open browser to product page and add product "${PRODUCT CODE}"
    Open browser to product page    ${PRODUCT CODE}
    Add product to cart

Open browser to shopping cart page
    Open browser to shopping cart page

Proceed to checkout with "Direct Bank Transfer"
    Navigate to Checkout page
    Place order

    [Teardown]    Close Browser

