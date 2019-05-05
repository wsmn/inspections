# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Images", type: :request) do
  let(:project) { create(:project) }

  it("render index and upload new") do
    get(project_images_path(project))
    follow_redirect!
    sign_in
    expect(response).to have_http_status(200)

    get(new_project_image_path(project))
    expect(response).to have_http_status(200)
    attributes = attributes_for(:image)

    post(project_images_path, params: {image: attributes})
    expect(response).to redirect_to(project_images_path(project))
    follow_redirect!

    expect(response).to have_http_status(200)
  end

  it("view edit and update image") do
    image = create(:image, project: project)
    get(edit_project_image_path(project, image))
    follow_redirect!
    sign_in
    expect(response).to have_http_status(200)

    attributes = {image: {description: "new description"}}
    patch(project_image_path(project, image), params: attributes)

    expect(response).to redirect_to(edit_project_image_path(project, image))
    follow_redirect!

    expect(response).to have_http_status(200)
  end

  it("destroys image and views index") do
    image = create(:image, project: project)
    sign_in

    delete(project_image_path(project, image))
    expect(response).to redirect_to(project_images_path(project))
    follow_redirect!
    expect(response).to have_http_status(200)
  end
end
