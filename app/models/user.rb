class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatables

  has_many :registrations
  has_many :games_played, :through => :registrations, :source => :game
  
  validates :uname, :presence => true
  validates :name,  :presence => true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
      user.uname = auth.info.email 
    end
  end

  def games_created
    Game.where(:creator_id => id)
  end
end
