class Notic < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by
  belongs_to :micropost
end
