class Course < ApplicationRecord
  validates :title, :city, length: { maximum: 50 }
  validates :title, :short_description, :description, :language, :level, :price, :date_start, :date_end, :country,
            :city, :picture, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :enrolments, dependent: :destroy
end
