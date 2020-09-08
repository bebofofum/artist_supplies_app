# artist_supplies_app

-Artist/User model + Supplies/Copics model. Artist has many copics. Copics belong to Artist.


# Project requirements

+ Build an MVC Sinatra application.
+ Use ActiveRecord with Sinatra.
+ Use multiple models.
+ Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
+ Must have user accounts - users must be able to sign up, sign in, and sign out.
+ Validate uniqueness of user login attribute (username or email).
- Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
- Ensure that users can edit and delete only their own resources - not resources created by other users.
+ Validate user input so bad data cannot be persisted to the database.

? BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)


# Redirect vs erb
erb used to generate response to an existing request while the redirect '/' creates a brand request/response new cycle so data before that is tossed out unless access the database. 

# ActiveRecord .find (eg. ArtItem.find(params[:id]) ) will raise an exception error if no record is found.

# error message gets added to ApplicationController

error ActiveRecord::RecordNotFound do
  @error = "Couldn't find that record"
  erb :index
end

# Sinatra flash for error? 'sinatra-flash'
in gem file add 'gem 'sinatra-flash''

# request.referrer how it works
As seen in the helper method "redirect_if_not_logged_in" the request.referrer is related to the url user was on prior to hitting the requested url. If the user is trying to go sraight to the page without a referring page then there won't be a request.referrer so request.referrer will be falsey and the error will trigger.

