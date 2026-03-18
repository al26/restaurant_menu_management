class MenuItem < ApplicationRecord
  belongs_to :restaurant, dependent: :destroy

  attribute :is_available, :boolean, default: true

  validates :name, :price, presence: true
  validates :price, numericality: true
end
