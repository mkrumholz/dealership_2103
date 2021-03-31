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
end
