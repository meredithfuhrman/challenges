class QuestionsController < ApplicationController
  def index
    @questions = Question.all.reverse_order
  end

  def new
    @question = Question.new
  end

  def create
    question = question_params
    question[:user_id] = current_user.id

    @question = Question.create(question)
    if @question.save
      flash[:notice] = "Question added"
      redirect_to question_answers_path(@question)
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question_id = params[:id]
    @question = Question.find(question_id)

    question = question_params
    question[:user_id] = current_user.id

    if @question = @question.update(question)
      flash[:notice] = "Question edited"
      redirect_to question_answers_path(question_id)
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  def destroy
    question_id = params[:id]
    @question = Question.find(question_id)
    @answer = Answer.where("question_id = #{question_id}")
    if @question.destroy
      @answer.each do |a|
        a.destroy
      end
    flash[:notice] = "Question deleted"
    redirect_to questions_path
    end
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
