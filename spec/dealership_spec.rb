require 'rspec'
require './lib/car'
require './lib/dealership'

describe Dealership do
  describe '#initialize' do
    it 'exists' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership).is_a? Dealership
    end

    it 'has a name' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.name).to eq "Acme Auto"
    end

    it 'has an address' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.address).to eq "123 Main Street"
    end

    it 'starts out with no inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory).to eq []
    end
  end

  describe '#inventory_count' do
    it 'knows the count of items in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory_count).to eq 0
    end
  end

  describe '#add_car' do
    it 'can add a car to the inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.inventory).to eq [car_1, car_2]
    end

    it 'increases inventory_count for each car added' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.inventory_count).to eq 2
    end
  end

  describe '#has_inventory?' do
    it 'returns false if inventory is empty' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.has_inventory?).to eq false
    end

    it 'returns true if there are cars in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.has_inventory?).to eq true
    end
  end

  describe '#cars_by_make' do
    it 'can list cars for a given make' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_by_make("Toyota")).to eq [car_2, car_3]
    end

    it 'returns an empty array if no cars of that make are in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.cars_by_make("Toyota")).to eq []
    end
  end

  describe '#total_value' do
    it 'calculates the total value of its inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.total_value).to eq 156000
    end

    it 'returns 0 if inventory is empty' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.total_value).to eq 0
    end
  end

  describe '#details' do
    it 'creates a details hash with critical information' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.details["total_value"]).to eq 156000
      expect(dealership.details["address"]).to eq "123 Main Street"
    end
  end

  describe '#average_price_of_car' do
    it 'calculates the average price of a car' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.average_price_of_car).to eq "39,000"
    end
  end

  describe '#cars_sorted_by_price' do
    it 'creates an array of cars sorted by price' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_sorted_by_price).to eq [car_3, car_4, car_2, car_1]
    end
  end

  describe '#inventory_hash' do
    it 'converts the hash to an inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.inventory_hash["Toyota"]).to eq dealership.cars_by_make("Toyota")
    end
  end
end
