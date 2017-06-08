class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @post = Post.find(answer_params[:post_id])
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to @post
    else
      @post_answers = []
      render 'static_pages/home'
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :post_id)
    end
end
