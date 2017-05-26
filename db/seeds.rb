require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url_hash = JSON.parse(open(url) { |io| io.read})

url_hash["drinks"].each do |element|
  Ingredient.create!(name: element["strIngredient1"])
end
