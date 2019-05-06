# frozen_string_literal: true

# Controller for landing page
class PresentationController < ApplicationController
  def index
    render(layout: 'landing')
  end

  def account
    @counts = {
      active: Project.active.count,
      completed: Project.completed.count,
      total: Project.all.count,
    }
  end
end
