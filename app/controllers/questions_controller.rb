class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to authenticated_root_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_answers_path
    else
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).delete
    redirect_to authenticated_root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :upvote, :downvote, :user_id)
  end
end