class Game < ApplicationRecord
  has_many :registrations
  has_many :players, :through => :registrations, :source => :user

  validates :title,           :presence => true
  validates :description,     :presence => true
  validates :address,         :presence => true
  validates :team_one_name,   :presence => true
  validates :team_two_name,   :presence => true
  validates :state,           :presence => true
  validates :start_time,      :presence => true

  validate  :time_validator

  geocoded_by :address   
  after_validation :geocode 
  after_validation :check_lat_long


  def time_validator
    # binding.pry
    if start_time + 4.hours < Time.now.utc + 10.minutes
      errors.add(:start_time, ": Has to be at least ten minutes from now.")
    end
  end

  def creator
    User.find(creator_id)
  end

  def self.not_started
    Game.where(:state => "Not Started").where('start_time > ?', DateTime.now)
  end

  def self.set_expiries
    puts "SET EXPIRE"

    Game.where(:state => "Not Started").each do |game|
      if game.start_time + 4.hours < Time.now
        game.state = "In Progress"
        game.save
      end
    end
  end

  def check_admin?(user)
    creator == user
  end

  def completed?
    state == "Completed"
  end

  def check_lat_long
    errors.add(:address, ": please enter a proper address") if latitude == nil || longitude == nil
  end
end
