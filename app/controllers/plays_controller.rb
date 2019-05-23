class PlaysController < ApplicationController

  def index
    @plays = Play.all.order("created_at DESC")
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)

    if @play.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def play_params
    @play = params.require(:play).permit(:title, :description, :director)
  end

end
