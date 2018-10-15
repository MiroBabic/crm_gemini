class StaticPagesController < ApplicationController

	def contacts
		@districts = District.all.order(:name)
		@subjtypes = Subjtype.all.order(:name)
		@subjects = Subject.all.order(:name)
	end

	def users
		@users = User.all
	end

	def create_email
		@subject_types = Subjtype.all.order(:name)
		@districts = District.all.order(:name)
		@counties =  District.all.pluck(:county).uniq.sort
		@users = User.all
		@templates = Mailtemplate.all
		@documents = Document.all
	end

end
