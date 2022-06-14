<div align="center">

This is Sweater Weather 
A backend application, exposing any endpoint needed for planning a roadtrip. 

  ## Table of Contents

  ### [Off the Bat](#off-the-bat)
  ### [Getting Started](#getting-started)
  ### [Calling The Endpoints](#calling-the-endpoints)
  ### [Testing](#testing)
  ### [Credits](#credits)
  ### [Technologies Used](#tech-behind-sweater-weather)
  ### [About This Project](#about-this-project)
  ### [Credits](#front-end-wire-frames)

</div>


# OFF THE BAT
  <div align="left">

- Ruby 2.7.4
- Rails 5.2.6
- This repo is a functioning back end only application.  To reach the available endpoints, it is suggested to use [<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://learning.postman.com/docs/getting-started/introduction/) .  
- This repo is front end ready. [Click Here](#front-end-wire-frames) for mock wire frames for a potential front end application.
- The [MapQuest APIs](https://developer.mapquest.com/), [Unsplash API](https://unsplash.com/developers), and the [OpenWeather API]([https://unsplash.com/developers](https://openweathermap.)) will require API keys for this program to run locally. 
  - Visit each API providers webpage to create an account and receive an API key
  - Run `bundle exec figaro install` from your command line to generate the `application.yml` file locally
  - From your command line run `<code/atom/idea> config/application.yml` to open the `application.yml`    file in your text editor. 
  - Use the variable `WEATHER_KEY` for your Open Weather API key
  - Use the variable `MAPQUEST_KEY` for your MapQuest API key
  - Use the variable `Unsplash_KEY` for your MapQuest API key
  - It should look like this: <br> <img width="462" alt="Screen Shot 2022-06-14 at 2 11 15 PM" src="https://user-images.githubusercontent.com/96802470/173698387-0df90ac5-d0b7-4c59-81f1-40b7ec8b1c85.png">
</div>

# GETTING STARTED
<div align="left">
:one: Fork or clone this repository <br><br>
:two: Install all gems locally by running `bundle install` from your command line <br><br>
:three: Create/reset database by running `rails db:{drop,create,migrate} from your command line`. <br><br>
:four: Start your local server with `rails s` from the command line. <br><br> 
:five: Call endpoints with a front end application or by using *POSTMAN* <br><br>
</div>
  

# CALLING THE ENDPOINTS
<div align="center">  
  <h2><b>Retrieve Weather/Forecast Data for a City</b></h2>
 </div>
Example Request:

<br>
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
<br>
  
Example Response:
<br>
```
{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-14 16:22:08 -0600",
                "sunrise": "2022-06-14 04:26:34 -0600",
                "sunset": "2022-06-14 18:49:16 -0600",
                "temperature": 90.3,
                "feelsLike": 102.83,
                "humidity": 64,
                "uvi": 2.3,
                "visibility": 10000,
                "conditions": "Clear",
                "icon": "01d"
            },
            "daily_weather": [
                {
                    "datetime": "06/14/2022",
                    "sunrise": "04:26:34 AM",
                    "sunset": "06:49:16 PM",
                    "max_temp": 97.09,
                    "min_temp": 79.11,
                    "conditions": "Rain",
                    "icon": "10d"
                },
                { ... etc }
               ],
              "hourly_weather": [
                {
                    "time": "16:00:00",
                    "temp": 90.3,
                    "conditions": "Clear",
                    "icon": "01d"
                },
  
```

<h3>About This Endpoint:</h3><br>
<i>In SweaterWeather, the retrieve forecast data endpoint is exposed by consuming two external APIs, parsing/organizing that data, instantiating the data into appropriate objects, then serializing result.  First, the location parameter given with the request, is used in a request to the MapQuest Geocoding API.  The response for this request contains the latitude and longitude of the city/location given.  Those coordinates are readable attributes of the Location Plain Old Ruby Object, and then they are used in a request to the OpenWeather API.  The response from this request is used to instantiate three POROs; Forecast, HourlyForecast, and DailyForecast.  These POROs allow for easy manipulation of the forecast data, as well as a way to effientely display the desired attributes in the ForecastSerializer/JSON response.</i>

<br>
<br>
  
<div align="center">  
  <h2><b>Retrieve a Background Image for a City</b></h2>
</div>
  


Example Request: <br>
```

GET /api/v1/backgrounds?location=atlanta,ga
Content-Type: application/json
Accept: application/json  
  
```
  
<br>
Example Response: <br>


```
  {
    "data": {
        "type": "image",
        "id": "null",
        "attributes": {
            "image": {
                "location": "atlanta,ga",
                "area": "Atlanta, GA",
                "image_url": "https://images.unsplash.com/photo-1599698000828-2cf0562f2bf4?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY4Njd8MHwxfHNlYXJjaHwxfHxhdGxhbnRhJTJDZ2F8ZW58MHx8fHwxNjU1MjQ1OTM5&ixlib=rb-1.2.1&q=80",
                "description": "woman in white and red floral tank top holding black smartphone during daytime",
                "credit": {
                    "source": "https://api.unsplash.com/photos/mM8igGR9NFY",
                    "author": "Jeffery Erhunse"
                }
            }
        }
    }
}
  

```
<br>
  
  
<h3>About This Endpoint:</h3><br>
<i>The location given in the parameters for this request is used to make a call to the Unsplash API.  The data from that response is used to make a Background PORO/object.  This object is used to effientely call the desired attributes for the JSON response.</i

<br><br>
<div align="center">  
  <h2><b>Retrieve Book Details and Forecast Data for a City</b></h2>
</div>
  
Example Request: <br>
```
GET /api/v1/backgrounds?location=albuquerque,nm&quantity=2
Content-Type: application/json
Accept: application/json
  
  
```  

Example Response: <br>

  
```
  {
    "data": {
        "id": "null",
        "type": "books",
        "attributes": {
            "destination": "albuquerque,nm",
            "forecast": {
                "summary": "Dust",
                "temperature": 94.26
            },
            "total_books_found": 2,
            "books": [
                {
                    "title": "The accelerated groups",
                    "isbn": null,
                    "publisher": [
                        "New Mexico Press"
                    ]
                },
                {
                    "title": "Hell's Quest",
                    "isbn": [
                        "1592991971",
                        "9781592991976"
                    ],
                    "publisher": [
                        "Inkwater Press"
                    ]
                }
            ]
        }
    }
}
  
  
```

<h3>About This Endpoint:</h3><br>
<i>The location and quantity parameter in this request is used to make a call to the OpenLibrary API.  The quantity parameter is used to limit the number of books returned from the Open Library API. The data is again used to instantiate a Book PORO for readable code in the BookSerializer. This endpoint makes use of the same code as the retrieve weather data endpoint to return forecast data for the same city as the book search.</i>


<div align="center">  
  <h2><b>Register a User</b></h2>
</div>
  
  
Example Request: <br>

```
 POST /api/v1/users
Content-Type: application/json
Accept: application/json

body: 
  
{
  "email": "skeeterthecorgi@corgi.com",
  "password": "skeeter",
  "password_confirmation": "skeeter"
}
  
```
  
Example Response: <br>

```
status: 200
body:
  
{
    "data": {
        "type": "users",
        "id": "3",
        "attributes": {
            "email": "skeeterthecorgi@corgi.com",
            "api_key": "45796ab40399a7ccdbbaa8dcfd6e0c"
        }
    }
}
  
  
``` 
  
<h3>About This Endpoint:</h3><br>
<i>This endpoint makes use of the one model used in SweaterWeather, the User model.  The `bcrypt` gem is utilized to ensure safe encrytion of the users passwords and it also allows for use of the `:password_confrimation` parameter, ensuring the users password is what they intended it to be.  The user information is passed in the body of the request, adding another layer of security.  If both password parameters match and a new User record is saved, an api_key is generated and assigned to that user via the api_key column in the User table. `SecureRandom.hex(15)` is used to generate the key, making sure it is a unique and safe key. Only the users id, email, and api key are included in the response body.</i>
<br>
  
<div align="center">  
  <h2><b>User Login</b></h2>
</div>


Example Request: <br>

```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

body:

{
  "email": "skeeterthecorgi@corgi.com",
  "password": "skeeter"
}
  
  ```

Example Response: <br>
  
  
  ```
status: 200
body:
  {
    "data": {
        "type": "users",
        "id": "1",
        "attributes": {
            "email": "corgi.com",
            "api_key": "3a31904f442331ef36275ed9de77a4"
        }
    }
}
  
  
  ```


<h3>About This Endpoint:</h3><br>
<i>Similar to the user sign up endpoint, the user login endpoint only accepts a users credentials through the request body.  The credentials are also only accessed/referenced by a private method in the SessionsController.  If a users password is successfully authenticated, the UserSerializer only includes the users id, email, and api key.</i>

<br>
  
  
<div align="center">  
  <h2><b>Roadtrip Endpoint</b></h2>
</div>

Example Request: <br>
  
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:
  
{
  "origin": "seattle,wa",
  "destination": "new york, ny",
  "api_key": "3a31904f442331ef36275ed9de77a4"
}
  
  
```

Example Response: <br>
  
```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "seattle,wa",
            "end_city": "new york, ny",
            "travel_time": "40:58:55",
            "travel_distance": 2890.7729,
            "weather_at_eta": {
                "temperature": 80.28,
                "conditions": "Clouds"
            }
        }
    }
}
  
  
```
  

<h3>About This Endpoint:</h3><br>
<i>Surely the most complicated endpoint offered by SweaterWeather, the Roadtrip Endpoint offers an incredibly valuable response.  An origin, destination, and API key are sent in the body of the request.  If the API key is valid, SweaterWeather will make a call to the MapQuest Geocoding API to receive latitude and longitute for the destination city, these coordinates are used in a call to the OpenWeather API to obtain forecast data for that city.  Both the origin and destination parameters supplied are used to make a call to the MapQuest Directions API to get the route data for the trip.  Both the forecast and route data are used to create a RoadTrip PORO.  This PORO is used in the RoadTripSerializer to structure the response in a readable and maintainable way </i><br>
<br>

# TESTING
<br>
Rspec Rails is the testing suite used in SweaterWeather.  Rspec allowed for readable, maintanable, and rigorous testing.  SweaterWeather has 100% test coverage.  All POROs, facades, services, controllers, and models are unit or integration tested. 
Sad path testing is done in all applicable request tests, including invalid parameters, empty parameters, missing parameters, and invalid credentials. To run the test suite, run `bundle exec rspec` from your command line. 


# CREDITS
<br>
  
[Open Library Search API](https://openlibrary.org/dev/docs/api/search/)<br> 
For book results / book-search endpoint <br><br>
[OpenWeather One Call API](https://openweathermap.org/api/one-call-api#how/)<br>
For fetching forecast data for forecast endpoint <br><br>
[MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)<br>
For returning latitude and longitute for a given city <br><br>
[MapQuest Route API](https://developer.mapquest.com/documentation/directions-api/route/get/) <br>
For returning route data for an origin and destination city<br>
[Unsplash Image Search API](https://unsplash.com/documentation#search-photos/)<br>
For returning background images for a given city<br><br>


  
  
  
  
# THE TECH BEHIND SWEATER WEATHER
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

# ABOUT SWEATER WEATHER
***About SweaterWeather:***
SweaterWeather was the Mod 3 final solo project for the Turing School of Software and Design's Back End program.  It was completed in five days.  The Retrieve Book Details and Forecast Data for a City end point was the final assessment/final independent challenge for Mod 3.  SweaterWeather was a challenging, hefty, but fun project to work on.  SweaterWeather brought many complex and interesting challenges to solve and it is a project that I am proud of.
  
# FRONT END WIRE FRAMES

















</div















