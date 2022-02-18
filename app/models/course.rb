class Course < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one :description, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :course_type, presence: true
  validates :image, presence: true
end
