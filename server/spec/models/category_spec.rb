require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it "has many products" do
      category = Category.create(name: "Example Category")
      product = Product.create(name: "Example Product", image: "example.jpg", description: "This is an example product", category: category, unit: "ounces", stocked: true, price: 10.00)

      expect(category.products).to include(product)
    end
  end
end
