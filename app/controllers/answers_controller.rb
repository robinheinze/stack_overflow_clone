class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question), :notice => 'Answer updated!'
    else
      @question = @answer.question
      render 'questions/show.html.erb'
    end
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question), :notice => 'Answer throw onto The Heap!'
    else
      @question = @answer.question
      render 'questions/show.html.erb'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@answer.question), :notice => 'Answer deleted.'
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
