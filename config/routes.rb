Rails.application.routes.draw do
  resources(:customers, only: [:index, :create])
  resources(:inspections, only: [:index, :new, :create])

  root(controller: :inspections, action: :index)
end
