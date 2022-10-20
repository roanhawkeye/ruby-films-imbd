# Script with objective of provide design patterns examples (3 design patterns)

"--------- SINGLETON -----------"

class Connector
  private_class_method :new

  @@instance = new

  def self.get_connection
    return @@instance
  end
end

connector_one = Connector.get_connection
connector_two = Connector.get_connection

# Bot references are using same instance
puts "#{connector_one.object_id}"
puts "#{connector_two.object_id}"

"--------- NULL OBJECT -----------"

class NullCar
  def drive
    puts "No car assigned"
  end
end

class Car

  def drive
    puts "driving the car"
  end

end

class User
  @car = nil

  def initialize(car)
    @car = car
  end

  def get_car
    @car || NullCar.new
  end

end

first_user = User.new(nil)
second_user = User.new(Car.new)

first_user.get_car.drive
second_user.get_car.drive

"--------- DECORATOR -----------"

class House 
  def description
    puts "This house have windows"
    puts "This house have main door"
  end
end

class HouseWithFirePlace
  @house  

  def initialize(house)
    @house = house
  end

  def description
    puts "This house have a fire place"
    @house.description
  end
end


house_with_fire_place = HouseWithFirePlace.new(House.new)
house_with_fire_place.description
