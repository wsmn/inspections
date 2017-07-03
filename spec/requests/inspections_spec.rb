# frozen_string_literal: true

require 'rails_helper'
RSpec.describe('Inspections') do
  let(:project) { create(:project) }
  let(:question) { create(:question) }
  it('vists inspections and creates a new') do
    get(project_path(project))
    expect(response).to have_http_status(200)
    get(new_project_inspection_path(project))
    attributes = { at_date: 5.days.from_now.to_date }

    post(project_inspections_path(project), params: { inspection: attributes })
    expect(response).to \
      redirect_to(project_inspection_path(project, project.inspections.last))
  end
end
