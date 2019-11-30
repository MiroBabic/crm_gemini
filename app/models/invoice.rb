class Invoice < ApplicationRecord
  belongs_to :implementation
  belongs_to :document
  belongs_to :invoice_profile
end
