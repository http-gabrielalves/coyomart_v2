require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it "belongs to a measurement unit" do
      measurement_unit = MeasurementUnit.create(name: "ounces", abbreviation: "oz")
      product = Product.create(name: "Example Product", image: "example.jpg", description: "This is an example product", unit: measurement_unit, stocked: true, price: 10.00, category_id: 1)

      expect(product.measurement_unit).to eq(measurement_unit)
    end
  end
end
