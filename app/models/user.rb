class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /\w+\s\w+/ }
  validates :password, length: { minimum: 5, message: "Password must be at least 5 characters" }
  validates :happiness, inclusion: { in: 1..5 }
  validates :nausea, inclusion: { in: 1..5 }
  validates :height, numericality: { greater_than: 0 }
  #validates :tickets, numericality: true don't need when number_field

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end

  def num_of_rides
    self.attractions.count
  end
end
