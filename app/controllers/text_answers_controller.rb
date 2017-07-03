# frozen_string_literal: true

# Save text answers
class TextAnswersController < ApplicationController
  def create
    load_inspections
    @answer = @entry.build_answer(text_answer_params)
    if save_answer(@answer, @entry)
      redirect_to(project_inspection_path(@inspection.project, @inspection),
                  notice: 'success')
    else
      redirect_to(project_inspection_path(@inspection.project, @inspection),
                  notice: 'fail')
    end
  end

  def update
    load_inspections
    @answer = TextAnswer.find(params[:id])
    @success = @answer.update(text_answer_params)
    render('/answers/updated')
    # if @answer.update(text_answer_params)
    #   redirect_to(project_inspection_path(@inspection.project, @inspection),
    #               notice: 'success')
    # else
    #   redirect_to(project_inspection_path(@inspection.project, @inspection),
    #               notice: 'fail')
    # end
  end

  private

  def load_inspections
    @inspection = Inspection.find(params[:inspection_id])
    @entry = @inspection.entries.find(params[:entry_id])
  end

  def text_answer_params
    params.require(:text_answer).permit(:answer)
  end

  def save_answer(answer, entry)
    answer.transaction do
      answer.save!
      entry.update!(answer: answer)
    end
    true
  rescue => error
    answer.errors(:base, error)
    false
  end
end
