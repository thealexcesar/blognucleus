class Post < ApplicationRecord

  has_rich_text :content

  belongs_to :user
  has_many :comments, dependent: :destroy

  before_create :set_default_status

  enum status: [:draft, :published]
  def set_default_status
    self.status ||= :draft
  end

  # ====================================================================================================================
  private

  def self.filter params
    conditions = []
    values = {}
    unless params[:title].blank?
      conditions << 'LOWER("title") LIKE :title'
      values[:title] = "%#{params[:title].to_s.downcase}%"
    end
    return [conditions.join(' AND '), values] unless values.empty?
  end
end
