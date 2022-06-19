class FavoritesController < ApplicationController
  def new
    favorite = current_user.favorite.blog.user.image(blog_id: params[:blog_id])
    redirect_to user_path, notice: "#{favorite.blog.user.name}さんの記事をお気に入り登録しました！"
  end

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}さんの記事をお気に入り登録しました！"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    edirect_to blogs_path, notice: "#{favorite.blog.user.name}さんの記事を解除しました！"
  end
end
