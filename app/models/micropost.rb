class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true
  validate :image_size
  
  private
  
  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "容量が5MBを超えています")
    end
  end
end
