class AnswersController < ApplicationController
  def index
    @answers = Answer.find(params[:question_id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect to question_answers_path
    else
      render 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to question_answers_path
    else
      render 'edit'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description, :upvote, :downvote, :question_id)
  end
end
