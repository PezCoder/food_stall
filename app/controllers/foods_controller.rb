class FoodsController < ApplicationController
  layout "application"

  before_action :get_variables

  def index
    @foods = Food.recent
  end

  def show
    @food = Food.find_by_id(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new(get_food_params)
    #get vendor from session

    if food.save
     #add food to vendor
      flash[:notice]="Food added to menu"
      redirect_to(:action=>'show',:id=>food.id)
    else
      flash[:error]="Error while creating food ! "
      render('new')
    end
  end

  def edit
    @food = Food.find_by_id(params[:id])
  end

  def update
    food = Food.find_by_id(params[:id])

    if food.update_attributes(get_food_params)
      flash[:notice]="Your menu has been updated."
      redirect_to(:action=>'show',:id=>food.id)
    else
      flash[:error]="Error wile updating food !"
      render('edit')
      @food = Food.find_by_id(params[:id])
    end
  end

  def destroy
    food = Food.find_by_id(params[:id])
    food.destroy
    flash[:notice]="'#{food.name}' has been removed from the menu."
    redirect_to(:action=>'index')
  end

  private 

  def get_food_params
    params.require(:food).permit(:name,:category,:price,:available,:delivery_time)
  end

  def get_variables
    @categories = ['South Indian','Gujrati','Rajasthani']
  end
end
