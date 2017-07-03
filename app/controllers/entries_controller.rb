# frozen_string_literal: true

# Handles creation of inspection questions and such.
class EntriesController < ApplicationController
  def create
    @inspection = Inspection.find(params[:inspection_id])
    @entry = @inspection.entries.build(entry_params)
    save_entry!
    @new_entry = @inspection.entries.build
    render
  end

  def destroy
    @inspection = Inspection.find(params[:inspection_id])
    @entry = @inspection.entries.find(params[:id])
    @entry.destroy!
    render
  end

  private

  def entry_params
    params.require(:entry).permit(:question_id, :kind, :question_string)
  end

  def save_entry!
    @entry.transaction do
      if @entry.question.nil?
        question = Question.new(kind: @entry.kind,
                                question: @entry.question_string)
        question.save!
        @entry.question = question
      end
      @entry.save!
    end
  end
end
