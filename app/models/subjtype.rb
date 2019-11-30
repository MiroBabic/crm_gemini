class Subjtype < ApplicationRecord
	has_many :subjects, :dependent => :destroy
end
