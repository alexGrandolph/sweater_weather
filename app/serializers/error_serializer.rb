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



end 