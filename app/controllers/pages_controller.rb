class PagesController < ApplicationController
  def index
    @games = Game.all
    @games_hash = Gmaps4rails.build_markers(@games) do |game, marker|
      marker.lat game.latitude
      marker.lng game.longitude
    end
  end
end
