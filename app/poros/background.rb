class Background
  attr_reader :description, :image_url, :source, :author, :area

  def initialize(attributes)
    @description = attributes[:description]
    @image_url = attributes[:urls][:full]
    @source = attributes[:links][:self]
    @author = attributes[:user][:name]
    @area = attributes[:tags][0][:title]
  end 

end