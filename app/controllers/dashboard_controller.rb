class DashboardController < ApplicationController
  def index
    @game = Game.last
    @tipsters = @game.picks.map(&:tipster)
  end
end
