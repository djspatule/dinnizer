class Dinner < ApplicationRecord
  belongs_to :user
  has_many :dinner_recipes, dependent: :destroy
  accepts_nested_attributes_for :dinner_recipes, allow_destroy: true
  has_many :recipes, through: :dinner_recipes
  has_many :dinner_guests, dependent: :destroy
  accepts_nested_attributes_for :dinner_guests, allow_destroy: true
  has_many :guests, through: :dinner_guests

  validates :dinner_date, presence: true
  validate :recipe_ids_are_unique
  validate :guest_ids_are_unique
  validate :recipes_belong_to_user
  validate :guests_belong_to_user

  private

  def active_recipe_ids
    dinner_recipes.reject(&:marked_for_destruction?).map(&:recipe_id).compact
  end

  def active_guest_ids
    dinner_guests.reject(&:marked_for_destruction?).map(&:guest_id).compact
  end

  def recipe_ids_are_unique
    ids = active_recipe_ids
    errors.add(:base, "You can't add twice the same recipe to a dinner") if ids.uniq.length != ids.length
  end

  def guest_ids_are_unique
    ids = active_guest_ids
    errors.add(:base, "You can't add twice the same guest to a dinner") if ids.uniq.length != ids.length
  end

  def recipes_belong_to_user
    return if user_id.blank?

    ids = active_recipe_ids.uniq
    return if ids.empty?

    errors.add(:base, 'Recipes must belong to you') if Recipe.where(id: ids, user_id: user_id).count != ids.length
  end

  def guests_belong_to_user
    return if user_id.blank?

    ids = active_guest_ids.uniq
    return if ids.empty?

    errors.add(:base, 'Guests must belong to you') if Guest.where(id: ids, user_id: user_id).count != ids.length
  end
end
