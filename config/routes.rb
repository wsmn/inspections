Rails.application.routes.draw do
  resources(:customers, only: %i[index create show edit])
  resources(:inspections, only: :index)
  resources(:projects) do
    resources(:inspections)
  end

  root(controller: :projects, action: :index)
end
