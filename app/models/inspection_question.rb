class InspectionQuestion < ApplicationRecord
  belongs_to(:question)
  belongs_to(:inspection)
end
