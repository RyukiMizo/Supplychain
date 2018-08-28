class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validate :image_size 
  validates :product, presence: true
  has_many :blocks, dependent: :destroy
  accepts_nested_attributes_for :blocks, allow_destroy: true
  
  
  private
  
  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "容量が5MBを超えています")
    end
  end
end
