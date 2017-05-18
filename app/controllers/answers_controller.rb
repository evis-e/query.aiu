class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to root_url
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
