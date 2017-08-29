class Dinner < ApplicationRecord
  belongs_to :recipe
  belongs_to :guest
  validates :guest, presence: true
end
