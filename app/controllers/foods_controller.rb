class FoodsController < ApplicationController
  layout false
  
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
    vendor = Vendor.find_by_id(params[:vendor_id])

    if food.save
      vendor.foods << food
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

    if food.update_attribute(get_food_params)
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
  end

  private 

  def get_food_params
    params.require(:food).permit(:name,:category,:price,:available,:order_date_time)
  end
end
