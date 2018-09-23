class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validate :photo_size
  validates :product, presence: true
  validates :blocks, associated: true
  has_many :blocks, dependent: :destroy
  has_many :chains, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  accepts_nested_attributes_for :blocks, allow_destroy: true
  
  
  def self.search(search)
    if search
      where(['product LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def likepost(likes)
    likes.each do |like|
      like.micropost
    end
  end
    
  
  private
  
def photo_size
  if photo.size > 5.megabytes
    errors.add(:photo, "容量が5MBを超えています")
  end
end


end
