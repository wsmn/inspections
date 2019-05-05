# frozen_string_literal: true

# View helper for projects
module ProjectHelper
  def project_statuses
    Project.statuses.keys.map { |k| [project_status(k), k] }
  end

  def project_status(key)
    t("models.project.status.#{key}")
  end

  def project_title(status = nil)
    content = [Project.model_name.human, project_tag(status)]
    content_tag(:h1, safe_join(content), class: "title is-1")
  end

  def project_tag(status, size: "medium", pos: "is-pulled-right")
    return if status.nil?
    cls = "tag #{project_status_class(status)} is-#{size} #{pos}"
    content_tag(:span, project_status(status), class: cls)
  end

  def project_status_class(status)
    case status
    when "active"
      "is-info"
    when "paused"
      "is-warning"
    when "completed"
      "is-success"
    when "cancelled"
      "is-danger"
    end
  end
end
