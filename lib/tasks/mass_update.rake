require 'csv'

namespace :mass_update do
	desc "this task updates contact names"
	task subject_contacts: :environment do

		begin
			file=File.open(Rails.root+'tmp/subjects.csv', "r")
			CSV.foreach(file, encoding: "utf-8", headers: true, :col_sep=>';') do |row|
				#puts row["meno"]

				begin
				
				@subject = Subject.joins(:district).where("subjects.name =? and districts.name = ?",row["obec"],row["okres"])
				
				unless @subject.present?
					subjname = "mesto "+row["obec"].to_s
					@subject = Subject.joins(:district).where("subjects.name =? and districts.name = ?",subjname,row["okres"])
				end

				if @subject.present?

				@person = Person.where(:subject_id=>@subject.first.id).first_or_create

				@person.first_name = row["meno"]
				@person.last_name = row["priezvisko"]
				@person.note = "starosta"
				@person.save

				else
					puts "Subjekt "+row["obec"] + " z okresu " + row["okres"] + " nebol najdeny"
				end
				rescue=>error
					puts "-----------------------------"
					puts error.message
					puts row["obec"]
					puts row["okres"]
					puts row["meno"]
					puts row["priezvisko"]
					puts "-----------------------------"
				end

			end
			

		rescue => error
			puts error.message
		end

	end
end