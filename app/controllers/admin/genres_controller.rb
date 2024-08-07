class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save!
    redirect_to request.referer
  end

  def destroy
    flash[:alert] = "本当に退会しますか？"
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to request.referer
  end

  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
