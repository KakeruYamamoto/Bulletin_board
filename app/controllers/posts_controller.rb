class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page]).per(12)
  end

  def search
     @q = Post.search(search_params)
     @posts = @q.result(distinct: true)
  end

  def show
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
        render :new
      else
      if @post.save
        redirect_to posts_path, notice:"スレッドを作成しました！"
      else
        render :new
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "スレッドを更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @post.user.id
      @post.destroy
      redirect_to posts_path, notice:"スレッドを削除しました！"
    end
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com',name: "ゲスト太郎") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, label_ids: [])
  end

  def search_params
    params.require(:q).permit!
  end

end
