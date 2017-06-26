require 'rails_helper'

RSpec.describe('Projects') do
  let(:customer) { create(:customer) }
  it('vists projects and creates a new') do
    get(projects_path)
    expect(response).to have_http_status(200)
    attributes = attributes_for(:project, customer: customer,
                                          customer_id: customer.id)

    post(projects_path, params: { project: attributes })
    expect(response).to redirect_to(project_path(Project.last))
  end
end
