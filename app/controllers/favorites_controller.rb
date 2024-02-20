class FavoritesController < ApplicationController
  before_action :set_blog

  def create
    respond_to do |format|
      current_user.favorites.create(blog_id: params[:blog_id])
      format.js { render :create }
    end
  end

  def destroy
    respond_to do |format|
      current_user.favorites.find_by(id: params[:id]).destroy
      format.js { render :destroy }
    end
  end

  def set_blog
    if params[:blog_id].nil?
      favorite = Favorite.find(params[:id])
      @blog = Blog.find(favorite.blog_id)
    else
      @blog = Blog.find(params[:blog_id])
    end
  end

end
