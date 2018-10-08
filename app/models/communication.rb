class Communication < ActiveRecord::Base
  belongs_to :subject
  belongs_to :person
  belongs_to :user
end
