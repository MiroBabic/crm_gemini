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


desc "this task updates subject types for selected subjects"
	task subject_types_obcemesta_ark: :environment do

		begin

			@subjtype = Subjtype.where(:name=>"Verejny_obce_mesta_ARK").first

			if @subjtype.present?

			file=File.open(Rails.root+'tmp/obce.csv', "r")
			CSV.foreach(file, encoding: "utf-8", headers: true, :col_sep=>';') do |row|
				#puts row["meno"]

				begin
				
				@subject = Subject.joins(:district).where("subjects.name =? and districts.name = ?",row["obec"].to_s.strip,row["okres"].to_s.strip)
				
				unless @subject.present?
					subjname = "mesto "+row["obec"].to_s.strip
					@subject = Subject.joins(:district).where("subjects.name =? and districts.name = ?",subjname,row["okres"].to_s.strip)
				end

				if @subject.present?


				@subject.first.subjtype_id = @subjtype.id
				#puts "nasiel sa " + @subject.first.name
				@subject.first.save

				else
					puts "Subjekt "+row["obec"] + " z okresu " + row["okres"] + " nebol najdeny"
				end
				rescue=>error
					puts "-----------------------------"
					puts error.message
					puts row["obec"]
					puts row["okres"]
					puts "-----------------------------"
				end

			end

		else
			puts "nenasiel sa typ subjektu Verejny_obce_mesta_ARK"
		end
			

		rescue => error
			puts error.message
		end

	end


desc "this task updates delayed_jobs"
	task delayed_job: :environment do

		begin

			@jobs = Delayed::Job.all

			if @jobs.present?
				i=0

				@jobs.each do |dj|
					dj.run_at = Time.now
					dj.attempts = 0
					dj.locked_at=nil
					dj.locked_by=nil
					dj.last_error=nil
					dj.save!

					i++
				end
			end
			
		puts "#{i} delayed jobs were successfuly restarted"

		rescue => error
			puts error.message
		end

	end



end