module BulmaFormHelper
  def bulma_field(f, field, kind: :text, options: nil)
    label = bulma_label(f.object, field)
    control = control(bulma_field_kind(f, field, kind, options: options))
    field_wrapper([label, control])
  end

  def bulma_field_kind(form, field, kind, options: nil)
    case kind
    when :text
      form.text_field(field, class: 'input')
    when :select
      content_tag(:span, class: "select") do
        form.select(field, options)
      end
    when :date
      form.text_field(field, class: 'input datepicker')
    end
  end

  def field_wrapper(elements)
    content_tag(:div, safe_join(elements), class: 'field')
  end

  def bulma_label(object, field)
    content_tag(:label, class: 'label', for: field) do
      object.class.human_attribute_name(field)
    end
  end

  def control(input)
    content_tag(:p, input, class: 'control')
  end

  def bulma_button(form)
    submit = control(form.submit(class: 'button is-primary'))
    field_wrapper([submit])
  end
end
