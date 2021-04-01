class Dealership

  attr_reader :name,
              :address,
              :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.length
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    inventory_count > 0
  end

  def cars_by_make(make)
    @inventory.find_all do |car|
      car.make == make
    end
  end

  def total_value
    @inventory.sum do |car|
      car.total_cost
    end
  end

  def details
    info = {}
    info["total_value"] = total_value
    info["address"] = address
    info
  end

  def average_price_of_car
    average = total_value / inventory_count
    avg_as_string = format_with_commas(average)
  end

  def format_with_commas(number)
    number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def cars_sorted_by_price
    @inventory.sort_by do |car|
      car.total_cost
    end
  end

  def inventory_hash
    Hash[unique_car_makes.collect {|key| [key, cars_by_make(key)]}]
  end

  def unique_car_makes
    unique_car_makes = @inventory.map do |car|
      car.make
    end.uniq
  end
end
