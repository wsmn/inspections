Rails.application.routes.draw do
  resources(:customers, only: %i[index create show])
  resources(:inspections, only: %i[index new create edit update destroy])

  root(controller: :inspections, action: :index)
end
