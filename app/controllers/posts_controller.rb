class PostsController < ApplicationController
  before_action :authenticate_user!, except: %w[index view]
  before_action :_post, only: :view
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      History.log(:new_post, @post)
      PostNotificationMailer.with(user: @post.user, post: @post)
                            .new_post_created
                            .deliver_now

      redirect_to posts_path
    else
      render :new
    end
  end

  def view;end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body)
  end

  def _post
    @post = Post.find_by(id: params[:id])

    redirect_to "/404.html" unless @post
  end
end
