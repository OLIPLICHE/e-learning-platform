class Course < ApplicationRecord
  validates :title, length: { maximum: 50 }
  validates :title, :short_description, :description, :language, :level, :price, :date_start, :date_end, :country,
            :city, :picture, presence: true

  belongs_to :user
  has_many :enrolments, dependent: :destroy
end
