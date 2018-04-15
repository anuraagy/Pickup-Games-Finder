# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Pages
  constructor: (@element) ->
    @map = @element.find("#map")

    @getLocation()
    @getGames()

  
  addMarkers: (data) =>
    games = JSON.parse(data)
    markers = []

    for game, i in games
      if game.latitude != null
        hash = {"lat": game.latitude, "lng": game.longitude, "infowindow": "<a href='/games/#{game.id}'>Game #{game.id}</a>"}
        console.log hash
        markers.push(hash)

    handler = Gmaps.build('Google')
    handler.buildMap {
      provider: {}
      internal: id: 'map'
      }, ->
        markers = handler.addMarkers(markers, {'open': true})
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    

    
  
  getGames: =>
    $.ajax
      url: "/games.json"
      data: {}
      success: (data, textStatus, jqXHR) =>
        @addMarkers(data)
      dataType: "script"

  getLocation: => 
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition @success, @error
    else
      console.log "Fail"
    
  success: (pos) ->
    console.log pos

  error: (err) ->
    console.log err




$ -> 
  new Pages($("body"))