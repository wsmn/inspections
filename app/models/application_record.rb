class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.searchable_language
    'swedish'
  end
end
