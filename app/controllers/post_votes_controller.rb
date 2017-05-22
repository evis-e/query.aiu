class PostVotesController < ApplicationController
  before_action :logged_in_user

  def create
    @post_vote = current_user.post_votes.build(post_votes_params)
    post = Post.find(post_votes_params[:post_id])
    if @post_vote.save
      flash[:success] = "Post upvoted!"
    end
    redirect_to post
  end

  def destroy
  end

  private

    def post_votes_params
      params.require(:post_vote).permit(:post_id, :vote)
    end
end
