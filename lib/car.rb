class Car

  attr_reader :make,
              :model,
              :monthly_payment,
              :loan_length,
              :color

  def initialize(brand, monthly_payment, loan_length)
    @make = brand.split(" ")[0]
    @model = brand.split(" ")[1]
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = nil
  end

  def total_cost
    @monthly_payment * @loan_length
  end

  def paint!(new_color)
    @color = new_color
  end
end
