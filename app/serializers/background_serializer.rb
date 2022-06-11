class BackgroundSerializer


  def self.background(background, location)

    {
      "data": {
        "type": "image",
        "id": "null",
        "attributes": {
          "image": {
            "location": location,
            "area": background.area,
            "image_url": background.image_url,
            "description": background.description,
            "credit": {
              "source": background.source,
              "author": background.author,
            }
          }
        }
      }
    }


  end 



end