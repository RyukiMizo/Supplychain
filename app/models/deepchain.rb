class Deepchain < ApplicationRecord
  belongs_to :chain
  validate :chainpicture_size
  validates :information, presence: true
  validates :place, presence: true
  validates :date, presence: true
  mount_uploader :chainpicture, ChainpictureUploader
  
  private
  
def chainpicture_size
  if chainpicture.size > 5.megabytes
    errors.add(:chainpicture, "容量が5MBを超えています")
  end
end

end
