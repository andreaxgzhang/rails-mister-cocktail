class CocktailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cocktail, only: [:show, :destroy, :edit, :update]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new

  end

  def new
    @cocktail = Cocktail.new
  end

  def create

    @cocktail = Cocktail.new(name:params[:name])
    if @cocktail.save
      sleep(0.8)
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.update(set_params)
      redirect_to @cocktail
    else
      render :edit
    end
  end
  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_params
    params.require(:cocktail).permit(:name, :url)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
