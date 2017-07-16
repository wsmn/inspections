# frozen_string_literal: true

module ApplicationHelper
  def nav_item_class(controllers, hidden: :desktop)
    str = 'nav-item is-tab'
    str += ' is-hidden-desktop' if hidden == :desktop
    str += ' is-active' if nav_active?(controllers)
    str
  end

  def nav_active?(controllers)
    controllers.include?(controller_name)
  end

  def aside_item_class(controllers)
    'is-active' if nav_active?(controllers)
  end
end
