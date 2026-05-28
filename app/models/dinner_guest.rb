class DinnerGuest < ApplicationRecord
  belongs_to :dinner
  belongs_to :guest

  validates :guest_id, uniqueness: { scope: :dinner_id }
end
