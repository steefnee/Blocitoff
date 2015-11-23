class Api::ItemsController < ApiController
  skip_before_filter :authenticate_user!

  def create
    @item = current_user.item.build(item_params)

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
  end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end

end
