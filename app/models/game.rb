class Game < ApplicationRecord
  has_many :registrations
  has_many :players, :through => :registrations, :source => :user

  validates :address,         :presence => true
  validates :team_one_name,   :presence => true
  validates :team_two_name,   :presence => true
  validates :team_one_score,  :presence => true
  validates :team_two_score,  :presence => true
  validates :state,           :presence => true

  geocoded_by :address   
  after_validation :geocode 
  after_validation :check_lat_long

  def creator
    User.find(creator_id)
  end

  def check_lat_long
    errors.add(:address, ": please enter a proper address") if latitude == nil || longitude == nil
  end
end
