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
    num_as_string = number.to_s
    num_reversed = num_as_string.reverse
    num_split_reversed = num_reversed.split(/(\d{3})(\d{2})/)
    num_split_reversed.shift
    num_back_to_string = num_split_reversed.join(',')
    num_str_in_order = num_back_to_string.reverse
  end
end
