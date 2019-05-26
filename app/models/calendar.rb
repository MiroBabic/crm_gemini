class Calendar < ActiveRecord::Base
  belongs_to :user

  def self.searchable_columns
  		[:title]
	end

end
