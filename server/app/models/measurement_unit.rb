class MeasurementUnit < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
    validates :abbreviation, presence: true, uniqueness: true, length: { minimum: 1, maximum: 5 }
    has_many :products
end
