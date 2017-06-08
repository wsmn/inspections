Rails.application.routes.draw do
  resources(:inspections, only: :index)
end
