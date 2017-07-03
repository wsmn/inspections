# frozen_string_literal: true

# Managing questions
class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to(edit_question_path(@question), notice: t('.success'))
    else
      render(:new, status: 422)
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to(edit_question_path(@question), notice: t('.success'))
    else
      render(:edit, status: 422)
    end
  end

  def destroy
    Question.find(params[:id]).destroy!
    redirect_to(questions_path, notice: t('.success'))
  end

  private

  def question_params
    params.require(:question).permit(:question, :kind, :description)
  end
end
