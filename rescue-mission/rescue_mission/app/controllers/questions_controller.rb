class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Question added."
      redirect_to questions_path
    else
      flash[:notice] = "Invalid entry."
      redirect_to :back
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
