class FavoritesController < ApplicationController

  def create
    respond_to do |format|
      @favorite = current_user.favorites.create(blog_id: params[:blog_id])
      format.js { render :favorite }
    end
  end

  def destroy
    respond_to do |format|
      @favorite = current_user.favorites.find_by(id: params[:id]).destroy
      format.js { render :favorite }
    end
  end

end
