class Reservation < ApplicationRecord
  belongs_to :course
  belongs_to :city
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
end
