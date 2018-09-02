class Introduction < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :affilitation, length: {maximum: 60}
  validates :content, length: {maximum: 1000}
  validates :site, length: {maximum: 255}
end
