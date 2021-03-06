class PostsController < ApplicationController
   skip_before_filter :verify_authenticity_token
     protect_from_forgery with: :null_session
  before_action :logged_in_user, only: [:create, :destroy, :like]
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
  	@post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to home_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	Post.find(params[:id]).destroy
  	flash[:success] = "Post deleted"
  	redirect_to request.referrer || home_url
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    end
  end


  private

    def post_params
    	params.require(:post).permit(:content, :picture)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to home_url if @post.nil?
    end

end
