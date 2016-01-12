class HomeController < ApplicationController
  def index
    @answers = Answer.all

    if params[:mine]
      @questions = current_user.questions

    elsif params[:sort_time]
      @questions = Question.all.sort_by{ |q| q.created_at}.reverse!

    elsif params[:sort_answers]
      @questions = Question.all.sort_by{ |q| q.answers_count}.reverse!

    else
      @questions = Question.all
    end

  end
end
