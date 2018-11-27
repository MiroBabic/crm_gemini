class Subjtype < ActiveRecord::Base
	has_many :subjects, :dependent => :destroy
end
