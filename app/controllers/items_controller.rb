class ItemsController < ApplicationController

before_action :authorize_user, except: [:show, :new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Your item has been added!"
      redirect_to root_path

    else
      flash[:error] = "There was an error creating your item. Please try again."
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end




end
