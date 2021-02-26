class Recipe < ActiveRecord::Base
  has_many :ingredients 

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attributes|
      self.ingredients.build(ingredient_attributes)
    end
  end
end
# why does deleting this method cause the fields_for to not iterate over the already made ingredients
# see how the quantity value is filled out, the value of that quantity is from controller
#when we delete this method, there is no more value and there is only one form as opposed to having three ingredients to iterate through