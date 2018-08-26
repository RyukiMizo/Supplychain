class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  mount_uploader :image, ImageUploader
  validate :image_size
  private
  
  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "容量が5MBを超えています")
    end
  end
end
