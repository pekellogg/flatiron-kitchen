require_relative "./concerns/search"

class Ingredient < ApplicationRecord
    validates :name, presence: true
    has_many :recipes, through: :recipe_ingredients
    has_many :recipe_ingredients

    include Search
end
