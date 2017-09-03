class Dinner < ApplicationRecord
  belongs_to :recipe
  belongs_to :guest
  belongs_to :user
  validates :guest, presence: true
end
