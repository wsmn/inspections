# frozen_string_literal: true

# Images for projects and inspections
class Image < ApplicationRecord
  belongs_to(:project)
  validates(:file, :description, presence: true)
  mount_uploader(:file, ImageUploader)

  scope(:taken_at, -> { order(taken_at: :desc) })

  def large
    file.large.url
  end

  def thumb
    file.thumb.url
  end
end
