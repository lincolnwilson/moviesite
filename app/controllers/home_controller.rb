class HomeController < ApplicationController
  def index
  end  
  def search
    movies = find_movie(params[:movie].gsub(' ','+')).first.second    
    unless movies
      flash[:alert] = 'Movie Not Found'
      return render action: :index
    end
    if movies == "False"
      flash[:alert] = 'Movie Not Found'
      return render action: :index
    else
      @movie = movies
    end
  end
  def createAccount
	@username = User.new(user_params)
	@username.save
	redirect_to @article
  end
  def login
	@user = User.find(user_params)
	if @user.username == :username
		login()
	else
		alert("Incorrect Login")
	end
  end
  private
  require 'rubygems'
  require 'httparty'
  include HTTParty
  base_uri "omdbapi.com"
  def find_movie(name)
	self.class.get("/?apikey=APIKEYHERE&s=#{name}")
  end
  def user_params
	params.require(:user).permit(:username,:password)
  end
end




