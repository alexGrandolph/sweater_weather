class ForecastSerializer

  
  def self.forecast_poro(forecast)
    { "data":
      {
        "id": 'null',
        "type": "forecast",
        "attributes": 
        {
          "current_weather": {
            "datetime": forecast.datetime,
            "sunrise": forecast.sunrise,
            "sunset": forecast.sunset,
            "temperature": forecast.temp,
            "feelsLike": forecast.feels_like,
            "humidity": forecast.humidity,
            "uvi": forecast.uvi,
            "visibility": forecast.visibility,
            "conditions": forecast.conditions,
            "icon": forecast.icon
          },
          "daily_weather":  forecast.daily.shift(5).map do |day| 
            {
              "datetime": day.datetime,
              "sunrise": day.sunrise,
              "sunset": day.sunset,
              "max_temp": day.max_temp,
              "min_temp": day.min_temp,
              "conditions": day.conditions,
              "icon": day.icon 
            }
          end, 
          "hourly_weather":  forecast.hourly.shift(8).map do |hour|
            {
              "time": hour.time,
              "temp": hour.temp,
              "conditions": hour.conditions,
              "icon": hour.icon 
            }
          end,
        }
      }
    }
    
    
  end
  
  
end 

# def self.forecast(forecast)
#   { "data":
#     {
#       "id": 'null',
#       "type": "forecast",
#       "attributes": 
#       {
#         "current_weather": {
#           "datetime": Time.at(forecast[:current][:dt]),
#           "sunrise": Time.at(forecast[:current][:sunrise]),
#           "sunset": Time.at(forecast[:current][:sunset]),
#           "temperature": forecast[:current][:temp],
#           "feelsLike": forecast[:current][:feels_like],
#           "humidity": forecast[:current][:humidity],
#           "uvi": forecast[:current][:uvi],
#           "visibility": forecast[:current][:visibility],
#           "conditions": forecast[:current][:weather][0][:main],
#           "icon": forecast[:current][:weather][0][:icon]
#           },
#         "daily_weather":  forecast[:daily].shift(5).map do |day| 
#           {
#             "datetime": Time.at(day[:dt]),
#             "sunrise": Time.at(day[:sunrise]),
#             "sunset": Time.at(day[:sunset]),
#             "max_temp": day[:temp][:max],
#             "min_temp": day[:temp][:min],
#             "conditions": day[:weather][0][:description],
#             "icon": day[:weather][0][:icon] 
#           }
#         end, 
#         "hourly_weather":  forecast[:hourly].shift(8).map do |hour|
#            {
#             "time": Time.at(hour[:dt]).strftime('%H:%M'),
#             "temp": hour[:temp],
#             "conditions": hour[:weather][0][:description],
#             "icon": hour[:weather][0][:icon] 
#          }
#         end,
#       }
#     }
#   }


# end
