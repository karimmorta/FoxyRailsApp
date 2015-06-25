class DashboardController < ApplicationController
  def index
  if params[:game_id]
    @game = Game.find(params[:game_id])
    @picks = @game.picks.where(game: @game)
    @tipsters = @game.picks.map(&:tipster)
    if !@game.picks.blank?
      @winning_team = @game.outcome.first
      @outcome = @game.outcome.second
    else
      redirect_to games_path
  end
  else 
    redirect_to games_path
  end
  rescue ActiveRecord::RecordNotFound
    redirect_to games_path
  end
end
