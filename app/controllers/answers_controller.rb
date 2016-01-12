class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])

    if params[:sort_time]
      @answers = Answer.where(:question_id => params[:question_id]).sort_by{ |a| a.created_at}.reverse!
    elsif params[:sort_votes]
      @answers = Answer.where(:question_id => params[:question_id]).sort_by{|a| a.cached_weighted_score}.reverse!
    else
      @answers = Answer.where(:question_id => params[:question_id])
    end
  end

  def upvote
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.upvote_by current_user
    redirect_to question_answers_path
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.downvote_by current_user
    redirect_to question_answers_path
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to question_answers_path
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
    params.require(:answer).permit(:description, :upvote, :downvote).merge(:question_id => params[:question_id])
  end
end
