class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  enum status: [ :draft, :published ]

  # validates :title, presence: true, uniqueness: true
  # validates :name, presence: true
  # validates :body, presence: true
end
