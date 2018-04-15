class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.all

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json { render :json => @games.as_json }
    end
  end

  def search
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id]) 

    @game.destroy
  end

  private

  def game_params
    params.require(:game).permit(:address, :team_one_name, :team_two_name, :team_one_score, :team_two_score, :creator_id, :state)
  end
end
