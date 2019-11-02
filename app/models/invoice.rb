class Invoice < ActiveRecord::Base
  belongs_to :implementation
  belongs_to :document
  belongs_to :invoice_profile
end
