class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Question added"
      redirect_to question_answers_path
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  def edit
  end

  def destroy
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id, :question_id)
  end
end
