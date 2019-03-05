class Iactivity < ActiveRecord::Base
  belongs_to :implementation
  belongs_to :user

  enum action_type: {implemenation_create: 0, implemenation_update: 1, document_upload: 2, procurement_change: 3, invoice: 4, implementation_change: 5}
end
