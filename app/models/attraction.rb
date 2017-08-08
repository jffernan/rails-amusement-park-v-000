class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true, uniqueness: true
  validates :tickets, numericality: { greater_than: 0 }
  validates :happiness_rating, inclusion: { in: 1..5 }
  validates :nausea_rating, inclusion: { in: 1..5 }
  validates :min_height, numericality: { greater_than: 0 }
end
