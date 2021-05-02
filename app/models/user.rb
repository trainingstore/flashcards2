class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :cards, dependent: :destroy
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }
end
