# Home To Horizon

## Summary
#### Educational Requirements
This project was conceptualized in 2 days as an educational challenge during my [DevBootcamp](http://devbootcamp.com) experience. 
* Build an web app for something that you are __passionate__ about
* Use Sinatra framework
* Has a database
* Styled user interface
* It utulizes Javascript
* It consumes minimum 1 API
* It is deployed to Heroku

#### Project Philosophy
As an adrenaline junkie and avid explorer of the outdoors, I have often organized expeditions that require more complex organization and financial resources. Unfortunately, looking for sponsorship funds is a tedious and time-consuming task which removes the focus from the essence: Exploring!

Brands on the other hand are more than ever looking for unique and authentic stories to relate themselves to or showcase their products. Often however, companies lack the proper tools to structure these sponsorship requests, screen the applicants and follow up on the return on investment.

Home To Horizon aims to create a marketplace for sponsorship requests.
* __Explorers__ can create a detailed profile for their project, link their different media (Facebook page, Instagram account, Twitter handle, etc.) and request sponsorship in an efficient and convenient way.
* __Brand Managers__ receives the request with key performance indicators on audience size and its fit with the company's policy. He/she can then easily benchmark different projects and grand the fund, gear or other with a few simple clicks.

![home to horizon homepage + login](/screenshots/hh_login.png "Home to Horizon home page + login dropdown")
_Homepage with a dropdown for login_


![Overview of projects](/screenshots/hh_projects.png "Overview projects")
_A user can browse through projects of interest_


![Project form](/screenshots/hh_create_project.png "Project form")
_A registred user can create a new project. The form accepts images and uses a default image if none provided._


![Project details](/screenshots/hh_project_detail.png "Project details")
_A project page displays some basic information to give brands and other users an idea about the concept. In this view, statistics about the project's fanpage are displayed (only accessible to project owners and brand managers) for evaluation puroposes of sponsorship requests._


![Sponsorship requests](/screenshots/hh_brands.png "Sponsorship request page")
_The owner of a project can request sponsorship by all related brands in just a few clicks. The brand manager will than receive a request with the project details, special note and an evaluation of the social media reach._


![User profile](/screenshots/hh_profile.png "User profile")
_Next to project pages, users can manage their own profile, participate in multiple projects and have their own sponsors._

#### Technology Stack
* Sinatra
* PostgreSQL
* JavaScript (AJAX & JQuery Library)
* Bootstrap + custom CSS
* API's
  * Google Maps Autocomplete
  * Google Maps Geocode
  * Google Maps Mapmarker
  * Facebook Pages (# Fans)
  * HighCharts (Display # of page fans per country on world map)

# To Do
* Fix Facebook API key
* Hide overall API keys for security purposes
* Brand dashboard