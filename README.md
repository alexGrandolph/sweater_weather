# README

***CREDITS:***
- openlibrary.orb API for book results / book-search endpoint
- openweathermap.org one-call API for fetching forecast data for forecast endpoint
- developer.mapquest.com Geocoding API for returning latitude and longitute for a given city
- unsplash.com API for returning background images for a given city















{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "sunrise": 1654852037,
        "sunset": 1654906818,
        "temperature": 79.4,*IN FARENHEIT*
        "feelsLike": 79.4,
        "humidity": 23,
        "uvi": 9.84,
        "visibility": 10000,
        "description": "overcast clouds"
        "icon": "04d"      
        },
      "daily_weather": [ **five days worth**
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          "sunset": "2020-10-01 16:10:43 -0600",
          "max_temp": 306.27, *IN FARENHEIT*
          "min_temp": 306.27, *IN FARENHEIT*
          "conditions": "clouds" 
          },
        {next day} etc
      ],
      "hourly_weather": [ **8 hours worth**
        {
          "time": "14:00:00",
          "temp": 304.76, *IN FARENHEIT*
          "conditions": ""overcast clouds"",
          "icon": "04d"
        },
        {next hour} etc
      ]
    }
  }
}





















This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



