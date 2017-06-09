module PanelHelper
  def active_panel(path, active, current)
    activated = active == current
    css = activated ? 'panel-block is-active' : 'panel-block'

    if activated
      content_tag(:div, class: css) do
        yield
      end
    else
      link_to(path, class: css) do
        yield
      end
    end
  end
end
