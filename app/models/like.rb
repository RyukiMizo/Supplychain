class Like < ApplicationRecord
    belongs_to :user
    belongs_to :micropost
    counter_culture :micropost
    validates :user_id, presence: true
    validates :micropost_id, presence: true
    has_many :notifications, dependent: :destroy
end
