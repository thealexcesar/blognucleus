class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  before_create :set_default_user_type

  enum user_type: [:user, :admin]
  def set_default_user_type
    self.user_type ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end
