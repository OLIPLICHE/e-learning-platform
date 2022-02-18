class Description < ApplicationRecord
  belongs_to :course

  validates :course_fee, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :price_daily, numericality: { greater_than: 0 }, presence: true
  validates :price_monthly, numericality: { greater_than: 0 }, presence: true
  validates :short_description, presence: true
end
