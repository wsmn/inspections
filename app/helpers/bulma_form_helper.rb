module BulmaFormHelper
  def bulma_horizontal(model)
    simple_form_for(model,
      wrapper: :horizontal_form,
      wrapper_mappings: {
        datepicker: :horizontal_datepicker,
        select: :horizontal_select,
        boolean: :horizontal_boolean,
        check_boxes: :horizontal_radio_and_checkboxes,
        radio_buttons: :horizontal_radio_and_checkboxes,
      }) do |f|
      yield(f)
    end
  end

  def bulma_button(f, horizontal: f.options[:wrapper] == :horizontal_form,
    parent: nil, text: nil)
    buttons = [bulma_submit(f, text)]
    buttons << bulma_destroy(f.object, parent: parent)

    cls = buttons.size > 1 ? "field is-grouped" : "field"
    buttons = content_tag(:div, safe_join(buttons), class: cls)
    horizontal ? bulma_horizontal_button(buttons) : buttons
  end

  def bulma_submit(form, text)
    content_tag(:p, class: "control") do
      if text.present?
        form.button(:submit, text)
      else
        form.button(:submit)
      end
    end
  end

  def bulma_destroy(obj, parent: nil)
    return unless obj.try(:persisted?)
    l = (parent.present? ? polymorphic_path([parent, obj]) : polymorphic_path(obj))
    content_tag(:p, class: "control") do
      link_to("Delete", l, method: :delete,
                           class: "button is-danger is-pulled-right")
    end
  end

  def bulma_horizontal_button(btn)
    content = [content_tag(:div, nil, class: "field-label")]
    content << content_tag(:div, class: "field-body") {
      btn
    }
    content_tag(:div, class: "field is-horizontal") do
      safe_join(content)
    end
  end
end
