class DosesController < ApplicationController
  before_action :set_cocktail, only:[:new, :create]
  def index
    @doses = Dose.all
  end
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(set_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end
  private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end