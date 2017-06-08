class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @answer = Answer.new
    @post = Post.find(params[:id])

    @post_answers = @post.post_answers.paginate(page: params[:page])
    @is_post_voted = @post.post_votes.exists?(user_id: current_user.id)
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content, :title)
    end
end
