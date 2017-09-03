class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :avatar
  has_many :guests
  has_many :recipes
  has_many :dinners
  validates :email, presence: true, uniqueness: true
end
