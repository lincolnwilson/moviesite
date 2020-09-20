class HomeController < ApplicationController
  def index
  end
  
  def standings
    standings = find_standings(params[:team])
  end
  
  private
end




