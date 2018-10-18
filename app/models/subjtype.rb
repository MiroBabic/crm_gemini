class Subjtype < ActiveRecord::Base
	has_many :subjtypes, :dependent => :destroy
end
