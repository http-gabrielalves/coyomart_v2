class Product < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates :image, presence: true
    validates :description, presence: true, length: { maximum: 500 }
    validates :category, presence: true
    validates :unit, presence: true
    validates :stocked, presence: true
    validates :price, presence: true
    
    belongs_to :measurement_unit, optional: true
    belongs_to :category, optional: true
end

