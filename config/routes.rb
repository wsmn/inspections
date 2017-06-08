Rails.application.routes.draw do
  resources(:inspections, only: :index)

  root(controller: :inspections, action: :index)
end
