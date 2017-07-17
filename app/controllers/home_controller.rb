# Controller for handling projects
class HomeController < ApplicationController
  def index
     @questions = Question.all
  end
  def new

  end
end
