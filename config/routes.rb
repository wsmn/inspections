# frozen_string_literal: true

Rails.application.routes.draw do
  resources(:passwords, controller: "clearance/passwords", only: %i[create new])
  resource(:session, controller: "clearance/sessions", only: %i[create])

  resources(:users, controller: "clearance/users", only: %i[create]) do
    resource(:password, controller: "clearance/passwords",
                        only: %i[create edit update])
  end

  get(:sign_in, controller: "clearance/sessions", action: :new, path: "sign-in")
  delete(:sign_out, controller: "clearance/sessions", action: :destroy,
                    path: "sign-out")
  get(:sign_up, controller: "clearance/users", action: :new, path: "sign-up")

  resources(:customers)
  resources(:time_entries, only: %i[index new])
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

  root(controller: :presentation, action: :index)
end
