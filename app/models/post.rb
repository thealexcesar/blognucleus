class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  # validates :title, presence: true, uniqueness: true
  # validates :name, presence: true
  # validates :body, presence: true
end
