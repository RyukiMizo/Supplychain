class Chain < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  has_many :deepchains, dependent: :destroy
  accepts_nested_attributes_for :deepchains, allow_destroy: true
  
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
