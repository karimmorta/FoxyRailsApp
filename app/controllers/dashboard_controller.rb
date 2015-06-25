class DashboardController < ApplicationController
  def index
    if params[:game_id]
      @game = Game.find(params[:game_id])
    else
      @game = Game.last
    end
    @picks = @game.picks.where(game: @game)
    @tipsters = @game.picks.map(&:tipster)
    if !@game.picks.blank?
      @winning_team = @game.outcome.first
      @outcome = @game.outcome.second
    end
  end
end
