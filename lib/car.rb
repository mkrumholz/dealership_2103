class Car

  attr_reader :make, :model, :monthly_payment, :loan_length
  def initialize(brand, monthly_payment, loan_length)
    @make = brand.split(" ")[0]
    @model = brand.split(" ")[1]
    @monthly_payment = monthly_payment
    @loan_length = loan_length
  end

  def total_cost
    @monthly_payment * @loan_length
  end
end
