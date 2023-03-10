class Category < ApplicationRecord
    has_many :products
    validates :name, length: { minimum: 3, maximum: 25 }
end
