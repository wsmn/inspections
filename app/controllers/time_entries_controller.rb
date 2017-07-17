# Controller to handle CRUD-actions for customers
class TimeEntriesController < ApplicationController
  def index
    @questions = Question.all
  end
  def new
    
  end
end
