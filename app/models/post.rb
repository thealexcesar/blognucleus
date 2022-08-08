class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  before_create :set_default_status

  enum status: [:draft, :published]
  def set_default_status
    self.status ||= :draft
  end

  # validates :title, presence: true, uniqueness: true
  # validates :name, presence: true
  # validates :body, presence: true
end
