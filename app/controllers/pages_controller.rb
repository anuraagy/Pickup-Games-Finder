class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    if current_user
      @games = Game.not_started
      @games_hash = Gmaps4rails.build_markers(@games) do |game, marker|
        marker.lat game.latitude
        marker.lng game.longitude
      end
    end
  end

  def search
    @games = Game.all
  end
end
