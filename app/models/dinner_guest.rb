class DinnerGuest < ApplicationRecord
  belongs_to :dinner
  belongs_to :guest
end
