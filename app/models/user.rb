class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items

  before_create :generate_api_token

  def generate_api_token
    loop do
      self.api_token = SecureRandom.base64(64)
      break unless User.find_by(api_token: api_token)
    end
  end

end
