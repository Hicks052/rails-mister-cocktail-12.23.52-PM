class IngredientsController < ApplicationController
before_action :set_ingredient, only: [:new, :create]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @review = Ingredient.new(ingredient_params)
    @ingredient.cocktail = @cocktail
    if @ingredient.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:cocktail, :dose)
  end

end
