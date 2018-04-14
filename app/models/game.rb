class Game < ApplicationRecord
  has_many :registrations
  has_many :players, :through => :registrations, :source => :user

  validates :address,         :presence => true
  validates :team_one_name,   :presence => true
  validates :team_two_name,   :presence => true
  validates :team_one_score,  :presence => true
  validates :team_two_score,  :presence => true
  validates :state,           :presence => true

  def creator
    User.find(creator_id)
  end
end
