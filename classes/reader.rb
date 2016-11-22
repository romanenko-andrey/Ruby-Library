class Reader
  attr_accessor :name, :email, :city, :street, :house
  def initialize(name, details = {})
    @name = name
    @email = details[:email]
    @city = details[:city]
    @street = details[:street]
    @house = details[:house]
  end
end