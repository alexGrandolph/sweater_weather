class ErrorSerializer

  def self.bad_quantity
    { "errors":
      {
        "quantity": ['Quantity must be a positive integer greater than zero']
      }      
    }
  end 

  def self.empty_location
    { "errors":
      {
        "location": ['Location parameter cannot be blank']
      }      
    }
  end 


  def self.no_books_found
    { "errors":
      {
        "books": ['No book matches for given location']
      }      
    }
  end 

  def self.password_mismatch
    { "errors":
      {
        "password": ['Passwords do not match']
      }      
    }
  end

  def self.bad_credentials
    { "errors":
      {
        "credentials": ['Bad credentials']
      }      
    }
  end
  
  def self.impossible_route(origin, destination)
    { "data": {
      "id": 'null',
      "type": 'roadtrip',
      "attributes": {
        "start_city": origin,
        "end_city": destination,
        "travel_time": "impossible route",
        "travel_distance":  "impossible route",
        "weather_at_eta": {
          "temperature":  "",
          "conditions":  ""
        }
      }
    }
  }
  end 

  def self.bad_api_key
    { "errors":
      {
        "credentials": ['Invalid API key']
      }      
    }
  end


end 