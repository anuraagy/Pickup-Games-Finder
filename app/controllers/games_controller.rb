class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.not_started

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json { render :json => @games.as_json }
    end
  end

  def search
    if params[:query] != ""
      @issues = Game.not_started.fuzzy_search(:title => params[:query])
    else
      @issues = Game.not_started
    end

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json {}
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      @game.players << current_user
      redirect_to @game
    else
      render :new
    end
  end

  def join_leave
    @game = Game.find(params[:game_id])
    # binding.pry
    if @game.players.include?(current_user)
      @game.players.delete(current_user)
    else
      Registration.create(:user_id => current_user.id, :game_id => @game.id)
    end

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json {}
      format.html {render layout: false, content_type: 'text'}
    end
  end

  def join_game
    @game = Game.find(params[:id])
    @user = current_user

    @game.players << @user

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json {}
      format.html {render layout: false, content_type: 'text'}
    end
  end

  def leave_game
    @game = Game.find(params[:id])
    @user = current_user

    @game.players.delete(@user)

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript'}
      format.json {}
      format.html {render layout: false, content_type: 'text'}
    end
  end

  def remove_player
    @game = Game.find(params[:id])
    @user = User.find(params[:user_id])

    if @game.check_admin?(current_user)
      @game.players.delete(@user)

      redirect_to @game, :notice => "The player was successfully removed!"
    else
      render @game, :notice => "There was an error while removing the player"
    end    
  end

  def start
    @game = Game.find(params[:id])

    if @game.check_admin?(current_user)
      @game.state = "In Progress"
      @game.save

      redirect_to @game, :notice => "The game has been started!"
    else
      render @game, :notice => "You are not an admin"
    end
  end

  def end
    @game = Game.find(params[:id])

    if @game.check_admin?(current_user)
      @game.state = "Completed"
      @game.save

      redirect_to @game, :notice => "The game has ended!"
    else
      render @game, :notice => "You are not an admin"
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
    params.require(:game).permit(:title, :description, :address, :team_one_name, :team_two_name, :team_one_score, :team_two_score, :creator_id, :state, :start_time)
  end
end
