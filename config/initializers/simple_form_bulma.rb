# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.include_default_input_wrapper_class = false
  config.generate_additional_classes_for = []
  config.browser_validations = true
  config.label_text = lambda do |label, required, _|
    "#{label} #{required}"
  end

  # Css defaults
  config.button_class = "button is-primary"
  config.error_notification_class = "notification is-warning"
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: "div", class: "field" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "label"
    b.use :input, wrap_with: {tag: "p", class: "control"}, class: "input"
    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.wrappers :vertical_select, tag: "div", class: "field" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "label"
    b.wrapper tag: "p", class: "control" do |ba|
      ba.use :input, wrap_with: {tag: "span", class: "select"}
    end
    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.wrappers :vertical_datepicker, tag: "div", class: "field" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "label"
    b.use :input, wrap_with: {tag: "p", class: "control"},
                  class: "input datepicker"
    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.wrappers :vertical_boolean, tag: "div", class: "field" do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: "p", class: "control" do |ba|
      ba.wrapper tag: "label", class: "checkbox" do |bb|
        bb.use :input
        bb.use :label_text
      end
    end

    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: "div",
                                                  class: "field" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "label"
    b.use :input, wrap_with: {tag: "p", class: "control"}
    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.wrappers :horizontal_form, tag: "div",
                                    class: "field is-horizontal" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "label", wrap_with: {tag: "div",
                                              class: "field-label is-normal",}

    b.wrapper tag: "div", class: "field-body" do |ba|
      ba.wrapper tag: "div", class: "field" do |bb|
        bb.use :input, wrap_with: {tag: "div", class: "control"},
                       class: "input"
        bb.use :error, wrap_with: {tag: "p", class: "help is-danger"}
        bb.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
      end
    end
  end

  config.wrappers :horizontal_select, tag: "div",
                                      class: "field is-horizontal",
                                      error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "label", wrap_with: {tag: "div",
                                              class: "field-label is-normal",}
    b.wrapper tag: "div", class: "field-body" do |ba|
      ba.wrapper tag: "div", class: "field is-narrow" do |bb|
        bb.wrapper tag: "p", class: "control" do |bc|
          bc.use :input, wrap_with: {tag: "span", class: "select"}, class: ""
        end
        bb.use :error, wrap_with: {tag: "p", class: "help is-danger"}
        bb.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
      end
    end
  end

  config.wrappers :horizontal_datepicker, tag: "div",
                                          class: "field is-horizontal" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "label", wrap_with: {tag: "div",
                                              class: "field-label is-normal",}
    b.wrapper tag: "div", class: "field-body" do |ba|
      ba.wrapper tag: "div", class: "field" do |bb|
        bb.use :input, wrap_with: {tag: "p", class: "control"},
                       class: "input datepicker"
        bb.use :error, wrap_with: {tag: "p", class: "help is-danger"}
        bb.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
      end
    end
  end

  config.wrappers :horizontal_boolean, tag: "div",
                                       class: "field is-horizontal" do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: "label", wrap_with: {tag: "div",
                                              class: "field-label is-normal",}
    b.wrapper tag: "div", class: "field-body" do |ba|
      ba.wrapper tag: "div", class: "field" do |bb|
        bb.wrapper tag: "p", class: "control" do |bc|
          bc.use :input, wrap_with: {tag: "span", class: "checkbox"}
        end
        bb.use :error, wrap_with: {tag: "p", class: "help is-danger"}
        bb.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
      end
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes,
    tag: "div",
    class: "field is-horizontal" do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: "label", wrap_with: {tag: "div",
                                              class: "field-label is-normal",}

    b.wrapper tag: "div", class: "field-body" do |ba|
      ba.wrapper tag: "div", class: "field" do |bb|
        bb.use :input, wrap_with: {tag: "p", class: "control radio-checkbox"}
        bb.use :error, wrap_with: {tag: "p", class: "help is-danger"}
        bb.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
      end
    end
  end

  config.wrappers :inline_form, tag: "div", class: "field" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "sr-only"

    b.use :input, class: "input", wrap_with: {tag: "p", class: "control"}
    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.wrappers :textarea, tag: "div", class: "field" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.use :label, class: "label"
    b.use :input, wrap_with: {tag: "p", class: "control"}, class: "textarea"
    b.use :error, wrap_with: {tag: "p", class: "help is-danger"}
    b.use :hint,  wrap_with: {tag: "p", class: "help is-info"}
  end

  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    boolean: :vertical_boolean,
    datepicker: :vertical_datepicker,
    collection: :vertical_select,
    select: :vertical_select,
    text: :textarea,
  }
end
