class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  before_create :set_default_status

  enum status: [:draft, :published]
  def set_default_status
    self.status ||= :draft
  end

end
