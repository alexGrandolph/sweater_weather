<div align="center">

This is Sweater Weather 
A backend application, exposing any endpoint needed for planning a roadtrip. 

  ## Table of Contents

  ### [Off the Bat](#off-the-bat)
  ### [Getting Started](#getting-started)
  ### [Calling The Endpoints](#calling-the-endpoints)
  ### [Testing](#testing)
  ### [Credits](#credits)
  ### [Technologies Used](#technologies-used)
  ### [About This Project](#about-this-project)
  ### [Credits](#front-end-wire-frames)




# Off the Bat
  <div align="left">

- Ruby 2.7.4
- Rails 5.2.6
- This repo is a functioning back end only application.  To reach the available endpoints, it is suggested to use [<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://learning.postman.com/docs/getting-started/introduction/) .  
- This repo is front end ready. `Click Here` for mock wire frames for a potential front end application.
- The *MapQuest APIs*, the *Unsplash API*, and the *Open Weather API* will require API keys for this program to run locally. 
  - Visit each API providers webpage to create an account and receive an API key
  - Run `bundle exec figaro install` from your command line to generate the `application.yml` file locally
  - From your command line run `<code/atom/idea> config/application.yml` to open the `application.yml`    file in your text editor. 
  - Use the variable `WEATHER_KEY` for your Open Weather API key
  - Use the variable `MAPQUEST_KEY` for your MapQuest API key
  - Use the variable `Unsplash_KEY` for your MapQuest API key
  - It should look like this: <image here>
</div>

**To Get Started:**
<div align="left">
:one: Fork or clone this repository <br><br>
:two: Install all gems locally by running `bundle install` from your command line <br><br>
:three: Create/reset database by running `rails db:{drop,create,migrate} from your command line`. <br><br>
:four: Start your local server with `rails s` from the command line. <br><br> 
:five: Call endpoints with a front end application or by using *POSTMAN* <br><br>
</div>
**Calling the Endpoints**

*Retrieve Weather/Forecast Data for a City*

Example Request:


Example Response:


About This Endpoint:
In SweaterWeather, the retrieve forecast data endpoint is exposed by consuming two external APIs, parsing/organizing that data, instantiating the data into appropriate objects, then serializing result.  First, the location parameter given with the request, is used in a request to the MapQuest Geocoding API.  The response for this request contains the latitude and longitude of the city/location given.  Those coordinates are readable attributes of the Location Plain Old Ruby Object, and then they are used in a request to the OpenWeather API.  The response from this request is used to instantiate three POROs; Forecast, HourlyForecast, and DailyForecast.  These POROs allow for easy manipulation of the forecast data, as well as a way to effientely display the desired attributes in the ForecastSerializer/JSON response. 

*Retrieve a Background Image for a City*

Example Request:


Example Response:


About This Endpoint:
The location given in the parameters for this request is used to make a call to the Unsplash API.  The data from that response is used to make a Background PORO/object.  This object is used to effientely call the desired attributes for the JSON response.


*Retrieve Book Details and Forecast Data for a City*

Example Request:


Example Response:


About This Endpoint:
The location and quantity parameter in this request is used to make a call to the OpenLibrary API.  The quantity parameter is used to limit the number of books returned from the Open Library API. The data is again used to instantiate a Book PORO for readable code in the BookSerializer. This endpoint makes use of the same code as the retrieve weather data endpoint to return forecast data for the same city as the book search. 

*Register a User*

Example Request:


Example Response:


About This Endpoint:
This endpoint makes use of the one model used in SweaterWeather, the User model.  The `bcrypt` gem is utilized to ensure safe encrytion of the users passwords and it also allows for use of the `:password_confrimation` parameter, ensuring the users password is what they intended it to be.  The user information is passed in the body of the request, adding another layer of security.  If both password parameters match and a new User record is saved, an api_key is generated and assigned to that user via the api_key column in the User table. `SecureRandom.hex(15)` is used to generate the key, making sure it is a unique and safe key. Only the users id, email, and api key are included in the response body.

*User Login*

Example Request:


Example Response:


About This Endpoint:
Similar to the user sign up endpoint, the user login endpoint only accepts a users credentials through the request body.  The credentials are also only accessed/referenced by a private method in the SessionsController.  If a users password is successfully authenticated, the UserSerializer only includes the users id, email, and api key.  


*Roadtrip Endpoint*

Example Request:


Example Response:

About This Endpoint:
Surely the most complicated endpoint offered by SweaterWeather, the Roadtrip Endpoint offers an incredibly valuable response.  An origin, destination, and API key are sent in the body of the request.  If the API key is valid, SweaterWeather will make a call to the MapQuest Geocoding API to receive latitude and longitute for the destination city, these coordinates are used in a call to the OpenWeather API to obtain forecast data for that city.  Both the origin and destination parameters supplied are used to make a call to the MapQuest Directions API to get the route data for the trip.  Both the forecast and route data are used to create a RoadTrip PORO.  This PORO is used in the RoadTripSerializer to structure the response in a readable and maintainable way.  The response will include:
- The origin city
- The destination city
- The estimated time of arrival
- The total distance in miles for the trip
- The weather forecast for the destination city at the time of arrival

***ERROR HANDLING/TESTING:***
Rspec Rails is the testing suite used in SweaterWeather.  Rspec allowed for readable, maintanable, and rigorous testing.  SweaterWeather has 100% test coverage.  All POROs, facades, services, controllers, and models are unit or integration tested. 
Sad path testing is done in all applicable request tests, including invalid parameters, empty parameters, missing parameters, and invalid credentials. To run the test suite, run `bundle exec rspec` from your command line. 


***CREDITS:***
- openlibrary.orb API for book results / book-search endpoint
- openweathermap.org one-call API for fetching forecast data for forecast endpoint
- developer.mapquest.com Geocoding API for returning latitude and longitute for a given city
- developer.mapquest.com Directions API for returning route data for an origin and destination city
- unsplash.com API for returning background images for a given city
Helpful Friends: @aspeth4, @jamesHarkins, @jamison, @juilet

***The Tech Behind SweaterWeather:***
- GitHub
- VS Code
- Ruby on Rails
- Ruby
- Postgresql
Gems:
- Bcrypt - encrypting user credentials
- Faraday - consuming APIs
- Webmock - testing API Consumption
- VCR - Testing API Consumption
- rspec - Test Suite
- ShouldaMatchers - Testing/Database Management
- Figaro - Environment Variables/Safe API Key Storage
- SimpleCov - Test Coverage 
- Pry - Debugging/Life Saving



***Front End Wireframes:***












***About SweaterWeather:***
SweaterWeather was the Mod 3 final solo project for the Turing School of Software and Design's Back End program.  It was completed in five days.  The Retrieve Book Details and Forecast Data for a City end point was the final assessment/final independent challenge for Mod 3.  SweaterWeather was a challenging, hefty, but fun project to work on.  SweaterWeather brought many complex and interesting challenges to solve and it is a project that I am proud of.




</div















