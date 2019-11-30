class Project < ApplicationRecord
  belongs_to :person
  belongs_to :user
  belongs_to :subject

  has_one :implementation
end
