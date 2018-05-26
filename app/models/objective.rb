class Objective < ApplicationRecord
  belongs_to :user

  validates :start, presence: true
  validates :end,   presence: true
end
