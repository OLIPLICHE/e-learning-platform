class Course < ApplicationRecord
  validates :title, length: { maximum: 50 }

  belongs_to :user
  belongs_to :enrolment
  has_one_attached :picture
end
