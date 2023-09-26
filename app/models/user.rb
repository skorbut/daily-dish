# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :registerable

  has_many :webauthn_credentials, dependent: :destroy
  has_many :dishes, dependent: :destroy
  has_many :cooked_dishes, dependent: :destroy
  has_many :favorite_dishes, dependent: :destroy

  validates :name, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
