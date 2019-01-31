class Implnote < ActiveRecord::Base
  belongs_to :implementation
  belongs_to :user
end
