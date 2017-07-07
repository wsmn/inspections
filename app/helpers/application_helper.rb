# frozen_string_literal: true

module ApplicationHelper
  def nav_item_class(controllers, hidden: :mobile)
    str = 'nav-item is-tab'
    str += ' is-hidden-mobile' if hidden == :mobile
    str += ' is-hidden-tablet' if hidden == :tablet
    str += ' is-active' if nav_active?(controllers)
    str
  end

  def nav_active?(controllers)
    controllers.include?(controller_name)
  end
end
