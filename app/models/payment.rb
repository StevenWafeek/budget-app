class Payment < ApplicationRecord
  belongs_to :user
  has_many :payment_groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
