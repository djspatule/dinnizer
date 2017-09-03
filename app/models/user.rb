class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :avatar
  validates :email, presence: true, uniqueness: true
  has_many :dinners, dependant: :destroy
  has_many :guests, dependant: :destroy
  has_many :recipes, dependant: :destroy
end
