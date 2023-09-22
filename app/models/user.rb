class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :registerable

  has_many :webauthn_credentials, dependent: :destroy

  validates :webauthn_id, uniqueness: true
end
