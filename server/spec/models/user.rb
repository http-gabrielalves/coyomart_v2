require 'rails_helper'

RSpec.describe User, type: :model do
    describe "associations" do
        it "has many categories" do
        category = Category.create(name: "Example Category")
        user = User.create(name: "Example User", email: "email@email.com", picture: "test", address: "test")
        expect(user.categories).to include(category)
        end
    end
end


        