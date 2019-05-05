# frozen_string_literal: true

# Handles active tab for panels
module PanelHelper
  def active_panel(path, active, current, active_cls: "active")
    activated = active == current
    css = activated ? "panel-block is-#{active_cls}" : "panel-block"

    if activated
      content_tag(:div, class: css) { yield }
    else
      link_to(path, class: css) { yield }
    end
  end

  def active_menu(path, active, current)
    if active == current
      content_tag(:li) { content_tag(:p, class: "is-active") { yield } }
    else
      content_tag(:li) { link_to(path) { yield } }
    end
  end
end
