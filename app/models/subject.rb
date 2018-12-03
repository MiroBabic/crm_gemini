class Subject < ActiveRecord::Base
  belongs_to :district
  belongs_to :subjtype
  belongs_to :user

  has_many :people, :dependent => :destroy
  has_many :communications, :dependent => :destroy
  has_many :media,  :dependent => :destroy
  has_many :projects, :dependent => :destroy


require 'csv'
  def self.import(file)
		total=0
		success=0
		failed=0

		CSV.foreach(file.path, encoding: "utf-8", headers: true, :col_sep=>';') do |row|
			total = total +1
			
			row["email"].downcase!
			admin_id = User.where(:email=>'admin@geminigroup.sk').first.id
			
			begin
				@district = District.where(:name=>row["okres"])
				@subjtype = Subjtype.where(:name=>row["typ_subjektu"])

				if (@district.present? && @subjtype.present? && admin_id.present?)

					@subject = Subject.where(:name=>row["subjekt"],:district_id=>@district.first.id, :subjtype_id=>@subjtype.first.id).first_or_create
					@subject.site = row["sidlo"]
					@subject.ico = row["ico"]
					@subject.note = row["poznamka"]
					@subject.web = row["web"]
					@subject.user_id = admin_id
					@subject.save

					@person = Person.where(:email=>row["email"]).first_or_create
					@person.subject_id = @subject.id
					@person.first_name = row["meno"]
					@person.last_name = row["priezvisko"]
					@person.cellphone = row["mobil"]
					@person.save

				
				success=success+1
				else
					failed = failed+1
				end
			rescue
				failed=failed+1
				next
			end
				
		end
		return rhash ={:total => total,:success=> success,:failed=>failed}
	end



end
