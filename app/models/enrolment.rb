class Enrolment < ApplicationRecord
  validates :review, :raiting, presence: true
  validates :raiting, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :course
  belongs_to :user
end
