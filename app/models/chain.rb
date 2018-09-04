class Chain < ApplicationRecord
  belongs_to :micropost
  has_many :deepchains, dependent: :destroy
  accepts_nested_attributes_for :deepchains, allow_destroy: true
end
