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

  # ====================================================================================================================
  private

  def self.filter params
    conditions = []
    values = {}
    unless params[:name].blank?
      conditions << 'LOWER("name") LIKE :name'
      values[:name] = "%#{params[:name].to_s.downcase}%"
    end
    return [conditions.join(' AND '), values] unless values.empty?
  end
end
