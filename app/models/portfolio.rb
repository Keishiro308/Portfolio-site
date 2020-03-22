class Portfolio < ApplicationRecord
  mount_uploader :image, PortfolioUploader
  validates :name, presence: true
  validates :image, presence: true
end
