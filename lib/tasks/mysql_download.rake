
namespace :mysql_download do
	desc "this task loads typ subjektu"
	task typ_subjektu: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			result = client.query("SELECT * FROM typ_subjektu")

			result.each do |res|
				subjtype = Subjtype.where(:name=>res["typ"]).first_or_create
				subjtype.about = res["typ_popis"]
				subjtype.save
			end

		rescue => error
			puts error.message
		end

	end

	desc "this task loads mail templates"
	task sablona: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			result = client.query("SELECT * FROM mail_template")

			result.each do |res|
				mtemp = Mailtemplate.where(:name=>res["name"]).first_or_create
				mtemp.content = res["text"]
				mtemp.created_at = res["entry_timestamp"]
				mtemp.updated_at = res["entry_timestamp"]
				mtemp.save
			end

		rescue => error
			puts error.message
		end

	end

	desc "this task loads documents"
	task dokumenty: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			result = client.query("SELECT a.id,a.name,a.type,a.size,a.content,a.entry_timestamp,a.subjekt,a.poznamka,u.email FROM dokumenty a, members u where a.autor = u.id")

			owners = User.all
			admin = User.where(:email=>'admin@geminigroup.sk').first

			result.each do |res|

				owner = owners.where(:email => res["email"]).first
				if owner.present?
					owner_id = owner.id
				else
					owner_id = admin.id
				end

				#puts res["content"].unpack('b*')
				document = Document.where(:file_name=>res["name"], :file_size=> res["size"]).first_or_create
				#doc = Base64.decode64(res["content"])
				filename = res["name"]

				File.open(Rails.root+'/tmp/'+filename, "wb") do |f|
					f.write(res["content"])
				end 

				file = File.open(Rails.root+'/tmp/'+filename, "rb") 
				document.note = res["poznamka"]
				document.user_id = owner_id
				document.file = file
				document.save
				
				File.delete(Rails.root+'/tmp/'+filename) if File.exist?(Rails.root+'/tmp/'+filename)
			end

		rescue => error
			puts error.message
		end

	end

	desc "this task loads users"
	task users: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			result = client.query("SELECT * FROM members")

			result.each do |res|
				user = User.where(:email=>res["email"]).first_or_create
				user.name = res["username"]
				user.password = "zaq1@WSX"
				user.save
				
			end

		rescue => error
			puts error.message
		end

	end

	desc "this task loads subjects and people"
	task subjects: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			#result = client.query("SELECT a.nazov,a.sidlo,a.ico,o.okres,t.typ,a.poznamka,a.web,a.pobyvatelov,a.zaujimavosti,a.entry_timestamp,u.email FROM subjekt a, members u, typ_subjektu t, okres o WHERE a.typ_subjektu = t.idtyp_subjektu and a.okres = o.idOkres and a.spravuje = u.id")


			result = client.query("SELECT a.idsubjekt,a.nazov,a.sidlo,a.ico,o.okres,t.typ,a.poznamka,a.web,a.pobyvatelov,a.zaujimavosti,a.entry_timestamp,u.email FROM subjekt a Left join members u on a.spravuje = u.id LEFT JOIN typ_subjektu t on a.typ_subjektu = t.idtyp_subjektu LEFT JOIN okres o ON a.okres = o.idOkres ")

			people = client.query("SELECT idkontakt, meno, priezvisko, email, email2, tel_cislo, mobil, poznamka, unsubscribe, subjekt from kontakt")


			owners = User.all
			admin = User.where(:email=>'admin@geminigroup.sk').first

			result.each do |res|
				district = District.where(:name=>res["okres"]).first
				subjtype = Subjtype.where(:name => res["typ"]).first


				owner = owners.where(:email => res["email"]).first
				if owner.present?
					owner_id = owner.id
				else
					owner_id = admin.id
				end

				if (district.present? && subjtype.present?)

					subject = Subject.where(:name=>res["nazov"], :district_id=>district.id, :subjtype_id=>subjtype.id, :oldcrm_subject_id=>res["idsubjekt"]).first_or_create
					subject.site = res["sidlo"]
					subject.ico = res["ico"]
					subject.note = res["poznamka"]
					subject.web = res["web"]
					subject.zaujimavost = res["zaujimavosti"]
					subject.citizen_count = res["pobyvatelov"]
					subject.created_at = res["entry_timestamp"]
					subject.user_id = owner_id
					subject.save

					people.each do |person|
						if (res["idsubjekt"] == person["subjekt"])
							pp=Person.where(:first_name=>person["meno"],:last_name=>person["priezvisko"],:email=>person["email"],:oldcrm_person_id=>person["idkontakt"],:subject_id=>subject.id).first_or_create
							pp.email2 = person["email2"]
							pp.phone = person["tel_cislo"]
							pp.cellphone = person["mobil"]
							pp.note = person["poznamka"]
							pp.save
						end
					end
				else
					puts "okres ci typ neexistuje"
					puts res["okres"]
					puts res["typ"]
				end
				
			end

		rescue => error
			puts error.message
		end

	end


	desc "this task loads communication"
	task communication: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			#result = client.query("SELECT a.nazov,a.sidlo,a.ico,o.okres,t.typ,a.poznamka,a.web,a.pobyvatelov,a.zaujimavosti,a.entry_timestamp,u.email FROM subjekt a, members u, typ_subjektu t, okres o WHERE a.typ_subjektu = t.idtyp_subjektu and a.okres = o.idOkres and a.spravuje = u.id")


			result = client.query("SELECT a.id,a.subjekt,a.contact, a.text, a.keyword,a.entry_timestamp, u.email FROM komunikacia a, members u where a.autor = u.id and keyword <> 'chyba'")

			

			owners = User.all
			admin = User.where(:email=>'admin@geminigroup.sk').first

			result.each do |res|
			
				owner = owners.where(:email => res["email"]).first
				if owner.present?
					owner_id = owner.id
				else
					owner_id = admin.id
				end

				subject = Subject.where(:oldcrm_subject_id=>res["subjekt"]).first
				contact = Person.where(:oldcrm_person_id=>res["contact"]).first
				
					if (subject.present? && contact.present?)

						comm = Communication.where(:about=>res["text"], :subject_id =>subject.id, :person_id=>contact.id, :keyword=>res["keyword"]).first_or_create
						comm.user_id = owner_id
						comm.created_at = res["entry_timestamp"]
						comm.save
					
					end

								
			end

		rescue => error
			puts error.message
		end

	end

	desc "this task loads media"
	task media: :environment do

		require 'open-uri'

		#begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			#result = client.query("SELECT a.nazov,a.sidlo,a.ico,o.okres,t.typ,a.poznamka,a.web,a.pobyvatelov,a.zaujimavosti,a.entry_timestamp,u.email FROM subjekt a, members u, typ_subjektu t, okres o WHERE a.typ_subjektu = t.idtyp_subjektu and a.okres = o.idOkres and a.spravuje = u.id")


			result = client.query("SELECT * from media")

			

			result.each do |res|

				
				subject = Subject.where(:oldcrm_subject_id=>res["idSubjekt"]).first
								
					if subject.present? 

						file_url = "https://crm.geminigroup.sk/"+res["url"]
						#puts file_url
						#puts CGI::escape(file_url)
						#tempfile = open(CGI::unescape(file_url))    
						begin
							tempfile = URI.parse(file_url)
						rescue URI::InvalidURIError
  							tempfile = URI.parse(URI.escape(file_url))
						end

						tempfile.open do |file|

							File.open(Rails.root+'/tmp/'+res["name"], "wb") do |f|
								f.write(file.read)
							end 

						file_out = File.open(Rails.root+'/tmp/'+res["name"], "rb") 
				
				
						 medium = Medium.where(:file_name=>res["name"],:subject_id=>subject.id).first_or_create
						 medium.file = file_out
						 medium.file_name = res["name"]
						 medium.subject_id = subject.id
						 medium.save

						 File.delete(Rails.root+'/tmp/'+res["name"]) if File.exist?(Rails.root+'/tmp/'+res["name"])
						end
					
					end

								
			end

		#rescue => error
		#	puts error.message
		#end

	end


desc "this task compare subjects"
	task compare_subjects: :environment do

		begin
			client = Mysql2::Client.new(:host => "mysql51.websupport.sk", :username => "48kqipf6",:port=>'3309', :database=>"48kqipf6", :password=>ENV['CRM_PHP_DBPASS'], :socket =>'/tmp/mysql51.sock')

			result = client.query("SELECT * from subjekt")

			result.each do |res|
				

				subject = Subject.where(:name=>res["nazov"]).first
					
					unless subject.present?
						puts "subjekt #{res["nazov"]} neexistuje v DB"
					end

				
			end

		rescue => error
			puts error.message
		end

	end

end
