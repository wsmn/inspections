# frozen_string_literal: true

# Handles active tab for panels
module PanelHelper
  def active_panel(path, active, current, active_cls: 'active')
    activated = active == current
    css = activated ? "panel-block is-#{active_cls}" : 'panel-block'

    if activated
      content_tag(:div, class: css) { yield }
    else
      link_to(path, class: css) { yield }
    end
  end
end
