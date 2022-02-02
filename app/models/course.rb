class Course < ApplicationRecord
  validates :title, length: { maximum: 50 }

  belongs_to :user
  has_many :enrolments, dependent: :destroy
end
