class StaticPagesController < ApplicationController

	def contacts
		@districts = District.all.order(:name)
		@subjtypes = Subjtype.all.order(:name)
		@subjects = Subject.all.order(:name)
	end

	def users
		@users = User.all
	end



end
