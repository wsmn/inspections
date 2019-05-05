# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Questions", type: :request) do
  describe("GET /questions") do
    it("views questions and creates a new") do
      sign_in
      get(questions_path)
      expect(response).to have_http_status(200)

      get(new_question_path)
      expect(response).to have_http_status(200)

      attributes = attributes_for(:question)
      post(questions_path, params: {question: attributes})
      expect(response).to redirect_to(edit_question_path(Question.last))
      follow_redirect!
      expect(response).to have_http_status(200)
    end
  end
end
