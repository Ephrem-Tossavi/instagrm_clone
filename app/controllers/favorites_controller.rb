class FavoritesController < ApplicationController
    def index
        @favorites = current_user.favorites.all 
        puts @favorites
    end
    def Show
    end
    def create
        favorite = current_user.favorites.create(blog_id: params[:blog_id])
        redirect_to blogs_path, notice: "#{favorite.blog.user.name}'S blog has been added to favorites"
    end
    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to blogs_path, notice: "#{favorite.blog.user.name}Unblogged Mr.'s blog"
    end
end
