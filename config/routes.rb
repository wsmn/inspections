# frozen_string_literal: true

Rails.application.routes.draw do
  resources(:customers)
  resources(:projects) do
    resources(:images, only: %i[create update destroy index new edit])
    resources(:inspections) do
      resources(:answers, only: %i[create update destroy])
    end
  end

  resources(:inspections, only: []) do
    resources(:entries, only: %i[create destroy]) do
      resources(:boolean_answers, only: %i[create update])
      resources(:text_answers, only: %i[create update])
    end
  end

  resources(:questions, only: %i[create new index edit update destroy])
  resource(:search, only: []) do
    post(:project)
    post(:customer)
  end

  root(controller: :projects, action: :index)
end
