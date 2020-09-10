## Project Name: ## 
The Art Bin

## Project Description: ## 
A simple art supply content manager. Art Items can be added, and a list neatly displayed of all your art supplies. The item's details can be viewed with an editable description of what the item is or deleted entirely depending on whether or not the item has been used up. 

## Project Install Instructions: ## 
1. Clone the repo.
2. In terminal, type cd 'art_supplies_app'
3. Run 'bundle install' to ensure all dependencies are installed. 
4. Generate a new SESSION_SECRET by running 'generate_secret' in Terminal.
5. Copy the output and paste it into the .env file after the '='
6. Run 'rake db:migrate' in Terminal to run migrations for creating the User and ArtItem database tables.
7. Run 'Shotgun' in Terminal to start the server.
8. In your browser open a new window and enter 'localhost:' followed by the server address shown by Shotgun, the last 4 digits after the colon. 
   (For example 'Listening on 127.0.0.1:9393' would use 9393, as in localhost:9393)


## Project Contributors: The Art Bin ##


## Project License: The Art Bin ## 
MIT License



Specifications for the Sinatra Assessment

Specs:

[X] Use Sinatra to build the app
[X] Use ActiveRecord for storing information in a database
[X] Include more than one model class (e.g. User, Post, Category)
    Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Include user accounts with unique login attribute (username or email)
    Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Ensure that users can't modify content created by other users
    Include user input validations
    BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
[ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

[ ] You have a large number of small Git commits
[ ] Your commit messages are meaningful
[ ] You made the changes in a commit that relate to the commit message
[ ] You don't include changes in a commit that aren't related to the commit message



