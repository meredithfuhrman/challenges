class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = Answer.where("question_id = #{params[:question_id]}")
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    answer =  answer_params
    answer[:user_id] = current_user.id
    answer[:question_id] = params[:question_id]

    @answer = Answer.create(answer)
    if @answer.save
      flash[:notice] = "Answer added"
      redirect_to question_answers_path
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  protected
  def answer_params
    params.require(:answer).permit(:description)
  end
end
