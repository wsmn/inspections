# frozen_string_literal: true

# Controller for landing page
class HomeController < ApplicationController
  def index
    @counts = {
      active: Project.active.count,
      completed: Project.completed.count,
      total: Project.all.count,
    }
  end
end
