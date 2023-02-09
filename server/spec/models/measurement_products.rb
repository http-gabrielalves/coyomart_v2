require 'rails_helper'

RSpec.describe MeasurementUnit, type: :model do
  describe "associations" do
    it "has many products" do
      measurement_unit = MeasurementUnit.create(name: "ounces", abbreviation: "oz")
      product = Product.create(name: "Example Product", image: "example.jpg", description: "This is an example product", category: "example", unit: measurement_unit, stocked: true, price: 10.00)

      expect(measurement_unit.products).to include(product)
    end
  end
end