class Communication < ApplicationRecord
  belongs_to :subject
  belongs_to :person
  belongs_to :user
end
