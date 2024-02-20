class FavoritesController < ApplicationController
  before_action :set_blog, only: [:create]
  before_action :set_id, only: [:destroy]

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
    @blog = Blog.find(params[:blog_id])
  end

  def set_id
    favorite = Favorite.find(params[:id])
    @blog = Blog.find(favorite.blog_id)
  end

end
