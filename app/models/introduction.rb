class Introduction < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :affilitation, length: {maximum: 255}
  validates :content, length: {maximum: 1000}
end
