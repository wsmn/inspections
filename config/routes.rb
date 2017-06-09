Rails.application.routes.draw do
  resources(:customers, only: [:index, :create])
  resources(:inspections, only: [:index, :new])

  root(controller: :inspections, action: :index)
end
