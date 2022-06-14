class Background
  attr_reader :description, :image_url, :source, :author, :area

  def initialize(attributes)
    @description = attributes[:description] || attributes[:alt_description]
    @image_url = attributes[:urls][:full]
    @source = attributes[:links][:self]
    @author = attributes[:user][:name]
    @area = attributes[:user][:location] || ""
  end 

end