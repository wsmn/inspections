# frozen_string_literal: true

module ApplicationHelper
  def nav_active?(controllers)
    controllers.include?(controller_name)
  end

  def aside_item_class(controllers)
    'is-active' if nav_active?(controllers)
  end

  def navbar_is_active(css, controllers)
    css += ' is-active' if nav_active?(controllers)
    css
  end
end
