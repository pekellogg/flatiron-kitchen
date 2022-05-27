require_relative "./concerns/search"

class Recipe < ApplicationRecord
    validates :name, presence: true
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_ingredients

    include Search
end
