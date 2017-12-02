# Specifications for the Rails Assessment

Specs:
- [X] ~~*Using Ruby on Rails for the project*~~
    * initialized the project with `rails new project_name`
- [X] ~~*Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)*~~
    * Crew has_many Assignments, Ship has_many Assignments
- [X] ~~*Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)*~~
    * Assignment belongs_to Crew and Ship
- [X] ~~*Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)*~~
    * Ship has_many Crew through Assignments, Crew has_many Ships through Assignments
- [X] ~~*The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)*~~
    * assignment name and description
- [X] ~~*Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)*~~
    * Crew name must be unique within the scope of a rank, Ship warp_factor must be a number
- [X] ~~*Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)*~~
    * `/ships/fastest`
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
    * Hmmmm
- [X] ~~*Include signup (how e.g. Devise)*~~
    * bcrypt
- [X] ~~*Include login (how e.g. Devise)*~~
    * bcrypt, session hash
- [X] ~~*Include logout (how e.g. Devise)*~~
    * bcrypt, session hash
- [X] ~~*Include third party signup/login (how e.g. Devise/OmniAuth)*~~
    * OmniAuth Twitter strategy
- [X] ~~*Include nested resource show or index (URL e.g. users/2/recipes)*~~
    * `/ships/1/assignments` lists all the assigned crew people for that ship with links to more detailed information about each individual assignment, like `/ships/1/assignment/2`
- [X] ~~*Include nested resource "new" form (URL e.g. recipes/1/ingredients)*~~
    * `/ships/1/assignments/new`
- [X] ~~*Include form display of validation errors (form URL e.g. /recipes/new)*~~
    * flash errors in the views

Confirm:
- [X] ~~*The application is pretty DRY*~~
    * I made an effort to avoid repetition
- [X] ~~*Limited logic in controllers*~~
    * for the most part.  I used some instance methods in the models, and some helpers and before_actions
- [X] ~~*Views use helper methods if appropriate*~~
    * current_user and logged_in?
- [X] ~~*Views use partials if appropriate*~~
    * _form