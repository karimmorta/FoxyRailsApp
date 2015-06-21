class DashboardController < ApplicationController
  def index
    if params[:game_id]
      @game = Game.find(params[:game_id])
    else
      @game = Game.last
    end
    @tipsters = @game.picks.map(&:tipster)
  end
end
