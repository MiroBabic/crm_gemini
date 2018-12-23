class Invoice < ActiveRecord::Base
  belongs_to :implementation
  belongs_to :document
end
