require 'csv'
require 'json'


namespace :mass_update do

	desc "load edb/finstat data"
	task load_edb_data: :environment do

		data = JSON.parse(File.read('output.json'))
		sukr_vp = Subjtype.find_by_name('Sukromny_VP')
		size =  data.size

		psc = CSV.parse(File.read("psc.csv"), headers: false, :col_sep => ";" )

	



		data.each do |record|
			begin
			print ""
			print size.to_s + "\r"
			
			#puts record

			
			next if Subject.where(:ico=>record["data"]["ico"]).present?

			subject = Subject.new
			subject.ico = record["data"]["ico"]
			subject.name = record["name"] unless subject.name.present?
			subject.site = record["data"]["address"].gsub("Adresa:",'') unless subject.site.present?
			subject.user_id = 5 unless subject.user_id.present?
			subject.web = record["data"]["webs"][1] unless subject.web.present?
			
			
			distr = ''
			psc.each do |rec|
				
				
				if rec[1].gsub(' ','') == record["data"]["address"].gsub(' ','').scan( /\d+$/).first
					distr = District.find_by_name(rec[0])
				elsif rec[1].split(' ').first == record["data"]["address"].gsub(' ','').scan( /\d+$/).first.slice(0..2)
					distr = District.find_by_name(rec[0])
					break
				end

			end

			
			if distr.present?
				district_id = distr.id
			else
				district_id = nil
			end

			subject.district_id = district_id  


			
				empl =  record["findata"]["kategoria_poctu_zamestnancov_(zo_statistickeho_uradu)_2020"]
				
				if empl == 'nezistený'
					empl =  record["findata"]["kategoria_poctu_zamestnancov_(zo_statistickeho_uradu)_2019"]
				end

				if empl == 'nezistený'
					empl =  record["findata"]["kategoria_poctu_zamestnancov_(zo_statistickeho_uradu)_2018"]
				else

					next
				end

			
			if (empl == '0 zamestnancov' || empl == nil)
				next
			end



			if empl.split(' ').first.split('-').size == 2
				max_empl = empl.split('-').last
			else
				max_empl = 1
			end

				if max_empl.to_i >= 250
					subject.subjtype_id = sukr_vp unless subject.subjtype_id.present?
				else
					
					if record["sector"].strip ==  "Automobilový priemysel"
						subject.subjtype_id = Subjtype.find_by_name("Automotive").id
					elsif record["sector"].strip ==  "Cestovný ruch a gastro"
						subject.subjtype_id = Subjtype.find_by_name("Cestovny_ruch_gastro").id
					elsif record["sector"].strip ==  "Doprava a logistika"
						subject.subjtype_id = Subjtype.find_by_name("Doprava_logistika").id
					elsif record["sector"].strip ==  "Energie a ťažba"
						subject.subjtype_id = Subjtype.find_by_name("Energie_tazba").id
					elsif record["sector"].strip ==  "Financie"
						subject.subjtype_id = Subjtype.find_by_name("Financie").id
					elsif record["sector"].strip ==  "Informačné technológie"
						subject.subjtype_id = Subjtype.find_by_name("IKT_telekomunikacie").id
					elsif record["sector"].strip ==  "Chémia a plasty"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Drevo a papier"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Elektrotechnika"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Kovovýroba a hutníctvo"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Maloobchod"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP").id
					elsif record["sector"].strip ==  "Média, vydavateľstvá a kultúra"
						subject.subjtype_id = Subjtype.find_by_name("Media_vydavatelstva_kultura").id
					elsif record["sector"].strip ==  "Nehnuteľnosti"
						subject.subjtype_id = Subjtype.find_by_name("Nehnutelnosti").id
					elsif record["sector"].strip ==  "Odevy a obuv"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Poľnohospodárstvo a lesníctvo"
						subject.subjtype_id = Subjtype.find_by_name("Polnohospodarstvo_lesnictvo").id
					elsif record["sector"].strip ==  "Potravinárstvo"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Právo, poradenstvo a účtovníctvo"
						subject.subjtype_id = Subjtype.find_by_name("Pravo_poradenstvo_uctovnictvo").id
					elsif record["sector"].strip ==  "Predaj a údržba vozidiel"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP").id
					elsif record["sector"].strip ==  "Projektovanie a inžiniering"
						subject.subjtype_id = Subjtype.find_by_name("Projektanti").id
					elsif record["sector"].strip ==  "Reklama"
						subject.subjtype_id = Subjtype.find_by_name("Reklama_marketing").id
					elsif record["sector"].strip ==  "Školstvo a vzdelávanie"
						subject.subjtype_id = Subjtype.find_by_name("Vzdelavacky_VZD").id
					elsif record["sector"].strip ==  "Služby"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP").id
					elsif record["sector"].strip ==  "Spracovanie odpadov"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_OH").id
					elsif record["sector"].strip ==  "Sprostredkovanie"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP").id
					elsif record["sector"].strip ==  "Stavebníctvo"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_SF").id
					elsif record["sector"].strip ==  "Strojárstvo"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Telekomunikácie"
						subject.subjtype_id = Subjtype.find_by_name("IKT_telekomunikacie").id
					elsif record["sector"].strip ==  "Veľkoobchod"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP").id
					elsif record["sector"].strip ==  "Výroba - ostatné"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Vývoj a testovanie"
						subject.subjtype_id = Subjtype.find_by_name("Sukromny_MSP_vyroba/vyskum").id
					elsif record["sector"].strip ==  "Zdravotníctvo"
						subject.subjtype_id = Subjtype.find_by_name("Zdravotnictvo").id
					else
						puts "Subject type nenajdeny pre ICO: #{record['ico']}"
						next
					end
				end
			

			#   subject.district_id = District.where(:county=>record["findata"]["county"]).first.id unless subject.district_id.present?

			if subject.save
				
				person = Person.new
				person.email = record["data"]["emails"][1]
				person.email2 = record["data"]["emails"][2]
				person.phone = record["data"]["phones"].join(';')
				person.subject_id = subject.id
				person.save
			else
				puts "nepodarilo sa ulozit subjekt"
			end


			size = size -1
		rescue=>error
			puts "-----------"
			puts error
			puts "-----------"
		end

		end

	end


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

desc "this task compares data from file with db for subjects"
task compare_subjects: :environment do
	begin
		file=File.open(Rails.root+'tmp/obce2020.csv', "r")
		CSV.foreach(file, encoding: "utf-8", headers: true, :col_sep=>'|') do |row|
			@subject = Subject.joins(:district).where("subjects.name =? and districts.name = ? and districts.county = ?",row["obec"].to_s.strip,row["okres"].to_s.strip, row["kraj"].to_s.gsub("kraj","").strip)

			unless @subject.present?
				@subject2 = Subject.joins(:district).where("subjects.name =? and districts.name = ? and districts.county = ?",("mesto " + row["obec"].to_s.strip),row["okres"].to_s.strip, row["kraj"].to_s.gsub("kraj","").strip)		
				unless @subject2.present?		
					puts row["obec"].to_s.strip + " " + row["okres"].to_s.strip + " " + row["kraj"].to_s.gsub("kraj","").strip
				end
			end

		end
	rescue=>error
		puts error.message
	end
end


desc "this task updates delayed_jobs"
	task delayed_job: :environment do

		begin

			@jobs = Delayed::Job.all

			 if @jobs.present?
                                i=0
                                act_time=Time.now
                                @jobs.each_slice(30) do |slice|
                                slice.each do |dj|
                                        dj.run_at = act_time
                                        dj.attempts = 0
                                        dj.locked_at=nil
                                        dj.locked_by=nil
                                        dj.last_error=nil
                                        dj.save!

                                        i = i+1
                                end
                                act_time = act_time+1.minute
                                end
                        end

			
		datetm = Time.now

		puts "#{i} delayed jobs were successfuly restarted at #{datetm}"

		rescue => error
			puts error.message
		end

	end



end