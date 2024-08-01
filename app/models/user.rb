# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exercises
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  validates :first_name, presence: true
  validates :last_name, presence: true

  self.per_page * 10

  def full_name
    "#{first_name} #{last_name}"
    # [first_name, last_name].join('')
  end
end
