class Api::UsersController < ApiController
  skip_before_filter :authenticate_user!
  
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
  if user.save
  # # 5
    render json: user
  else
  # # 6
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
