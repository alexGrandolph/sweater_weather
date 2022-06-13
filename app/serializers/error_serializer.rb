class ErrorSerializer

  def self.bad_quantity
    { "data":
      {
        "error": {
          "message": 'Quantity must be a positive integer greater than zero'
        }
      }      
    }
  end 

  def self.empty_location
    { "data":
      {
        "error": {
          "message": 'Location parameter cannot be blank'
        }
      }      
    }
  end 


  def self.no_books_found
    { "data":
      {
        "error": {
          "message": 'No book matches for given location'
        }
      }      
    }
  end 



end 