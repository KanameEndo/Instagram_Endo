class BlogsController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]
  def index
    @blogs = Blog.all
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
    render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿しました！"
        ContactMailer.contact_mail(@blog).deliver
      else
        render :new
      end
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
    unless @blog.user == current_user
      redirect_to blog_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to blog_path
      else
        if @blog.update(post_params)
          redirect_to blog_path
        else
          render :edit
      end
    end
  end

  def destroy
    @blog = Blog.all
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to blog_path, notice: "削除しました"
    else
      @blog.destroy
    end
  end

  private
  def blog_params
  params.require(:blog).permit(:name, :title, :content, :user_id, :image, :image_cache)
  end

  def correct_user
    @blog = current_user.blogs.find_by(id: params[:id])
    unless @blog
      redirect_back(fallback_location: root_path)
    end
  end
end

