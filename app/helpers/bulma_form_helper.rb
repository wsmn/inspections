module BulmaFormHelper
  def bulma_horizontal(model)
    simple_form_for(model,
                    wrapper: :horizontal_form,
                    wrapper_mappings: {
                      datepicker: :horizontal_datepicker,
                      select: :horizontal_select,
                      boolean: :horizontal_boolean,
                      check_boxes: :horizontal_radio_and_checkboxes,
                      radio_buttons: :horizontal_radio_and_checkboxes
                    }) do |f|
      yield(f)
    end
  end

  def bulma_button(f, horizontal: f.options[:wrapper] == :horizontal_form)
    btn = content_tag(:div, class: "field") do
      content_tag(:div, class: 'control') do
        f.button(:submit)
      end
    end
    horizontal ? bulma_horizontal_button(btn) : btn
  end

  def bulma_horizontal_button(btn)
    content = [content_tag(:div, nil, class: 'field-label')]
    content << content_tag(:div, class: 'field-body') do
      btn
    end
    content_tag(:div, class: 'field is-horizontal') do
      safe_join(content)
    end
  end
end
