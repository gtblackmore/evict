# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (Used sinatra gem)
- [x] Use ActiveRecord for storing information in a database (Used activerecord gem)
- [x] Include more than one model class (e.g. User, Post, Category) (Used user, property, and entity models)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (User has many entities and properties through entities; Entities have many properties)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Properties belong to entities; Entities belong to user)
- [x] Include user accounts with unique login attribute (username or email) (User model validates_uniqueness_of email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Built a page unique to each user that displays entities and properties belonging to a user and allowing creation of both new entities and properties along with updating each)
- [x] Ensure that users can't modify content created by other users (Added route protection through current_user method)
- [x] Include user input validations (Used valid_params method to determine whether key values in params were present)
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) (Used rack-flash3)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits (I think so)
- [x] Your commit messages are meaningful (I think so)
- [x] You made the changes in a commit that relate to the commit message (Tried my best)
- [x] You don't include changes in a commit that aren't related to the commit message (Tried my best)