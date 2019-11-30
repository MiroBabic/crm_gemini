class Impchange < ApplicationRecord
  belongs_to :implementation
  belongs_to :user
end
