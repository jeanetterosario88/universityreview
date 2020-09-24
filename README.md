
# THE UNIVERSITY REVIEW


## INTRODUCTION

This project builds the The University Review: a site where users can read and write reviews about their Alma Mater.


## OVERVIEW

This is Ruby on Rails application that uses:

* SQLITE

* ActiveRecord

* RESTful routes

* Nested routes

* Sessions

* Login/Logout

* OmniAuth

* Search Engine

* HTML

This application implements three classes: User, University, & Review. A user cannot take any actions outside of signing up, unless they are logged in. They can sign up on the website, or they can skip the sign up, and log in with their Facebook account. While logged in, a user can read, edit, and create reviews. They can search for a university, and even create a new one, if theirs is not listed. Finally, of course, they can log out.


## DEVELOPMENT

Fork and clone this project. Try this app in your local environment. 

Run the following commande inside this project's directory.


    $ bundle install

    $ rake db:migrate


    $ rake db:seed (if applicable)


Start up local server


    $ rails s


For interactive console


    $ rake console
    

## FUTURE IMPROVEMENTS

* Add confirm password during sign up


## CONTRIBUTING

Bug reports and pull requests are welcome on GitHub at https://github.com/jeanetterosario88/universityreview.git. Contributors are expected to adhere to the Contributor Covenant code of conduct.