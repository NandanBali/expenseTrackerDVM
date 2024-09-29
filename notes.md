## Proper state management & routing
    - [x] Auto refresh the homepage and transaction history without any refresh buttons
        - Implement provider for global state management -> Done
    - [x] There should be no back button on the form. -> Done
        // TODO: Build the form
## Better UI
    - [x] Simplify the entire app into a single page w/ EXPENSES, INCOME & BALANCE ON THE SAME PAGE
    - [x] Recent transaction history on the same page
    - [x] form should be accessible by a single floating button, present everywhere in the app.
        - use modalbottomsheet
## Improve form
    - [x] Make it a floating form or a bottom pagesheet. 
    - [x] Amount, category & description
    - [x] form validation -> don't add tx if the balance is 0
    - [x] on touching elsewhere, the form should quit or lose focus of text boxes
    - [x] Make using simple widgets
## Store data
    - [] Use JSON to serialize account
    - [] Deserialize
        - Learn serialization with JSON and Flutter