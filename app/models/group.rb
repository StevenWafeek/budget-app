class Group < ApplicationRecord
  belongs_to :user
  has_many :payment_groups, dependent: :destroy

  validates :name, :icon, presence: true
end
