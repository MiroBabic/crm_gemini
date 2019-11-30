class Calendar < ApplicationRecord
  belongs_to :user

  def self.searchable_columns
  		[:title]
	end

end
