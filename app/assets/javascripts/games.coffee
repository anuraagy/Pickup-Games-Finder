class Games
  constructor: (@element) ->
    @join_leave_button  = @element.find("#join-leave-game")
    @leave_button       = @element.find("#leave-game")
    @start_button       = @element.find("#start-game")
    @end_button         = @element.find("#end-game")
    @remove_buttons     = @element.find(".remove-player")

    @game = @element.find("#game-id")
    @user = @element.find("#user-id")
    @name = @element.find("#user-name")
    @players = @element.find("#players")

    @join_leave_button.on   "click", @joinOrLeaveGame
    @leave_button.on        "click", @leaveGame
    @start_button.on        "click", @startGame
    @end_button.on          "click", @endGame

  joinOrLeaveGame: =>
    $.ajax
      type: 'POST'
      url: "/games/join_leave"
      data: { game_id: @game.val(), user_id: @user.val() }
      success: (@changeText())
      error: (console.log "error")
      dataType: "script"

  changeText: =>
    if @join_leave_button.text() == "Join Game"
      @join_leave_button.text("Leave Game")
      @players.append("<li id='player-#{@user.val()}' class='list-group-item d-flex justify-content-between align-items-center'>
               #{@name.val()}
                </li>")
    else 
      @join_leave_button.text("Join Game")
      $("#player-#{@user.val()}").remove()
     

  startGame: =>
    $.ajax
      type: 'POST'
      url: "/games/search"
      data: { query: query }
      success: (console.log "hello")
      dataType: "script"

  endGame: =>
    $.ajax
      type: 'POST'
      url: "/games/search"
      data: { query: query }
      success: (console.log "hello")
      dataType: "script"



$ -> 
  new Games($("body"))