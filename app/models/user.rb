class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :avatar
  validates :email, presence: true, uniqueness: true
  has_many :dinners
  has_many :guests
  has_many :recipes
end
