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
  end
end
