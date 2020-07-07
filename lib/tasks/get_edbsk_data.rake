require 'mechanize'
require 'nokogiri'
require 'openssl'
require 'open-uri'
require 'pp'
require 'activerecord-import/base'

namespace :get_edbsk_data do

  desc "test"
  task download_test: :environment do
  	url = 'https://www.edb.sk/sk/firmy/hpk-engineering-a-s--S000002313000.html'
  	agent = Mechanize.new
	agent.user_agent_alias = 'Windows Mozilla'
	agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
	page = agent.get(url)

	body = page.body


	doc = Nokogiri::HTML(body)
	doc.encoding = "utf-8"
	
	naces = doc.xpath('//div[contains(text(), "Odborová klasifikácia NACE:")]/following-sibling::*')

	#naces[1].each do |nace|
	#	puts nace.xpath('tr/*')
	#	puts "----"
	#end
	naces[0].xpath('tr/*').each do |nace|
		puts nace.text
	end

  end





  desc "this task download detail data for companies from edb.sk"
  task download_details_companies: :environment do
  	baseurl = 'https://www.edb.sk'

  	@companies = ExternalCompany.where("data is null")
  	total = @companies.size
  	puts "found #{total} companies to download info"

  	i = 0
  	@companies.each_slice(200) do |slice|
  		i=i+200

  		hydra = Typhoeus::Hydra.new(max_concurrency: 10)
  		@companies_data = Array.new

  		slice.each do |company|

  			Typhoeus::Config.user_agent = "Windows Mozilla"

			request = Typhoeus::Request.new((baseurl+company.url.to_s),
				method: :get,
				#:followlocation => true,
				#:verbose=>true,
				ssl_verifyhost: 0,
                 ssl_verifypeer: false,
				 cainfo: OpenSSL::X509::Certificate.new(File.read Rails.root.join('curl_cert/').join("example.crt")),
                 sslkey: OpenSSL::PKey::RSA.new(File.read Rails.root.join('curl_cert/').join("example.key"))
                 )

			
			request.on_complete do |response|

						if response.success?
				        #	pp response.effective_url

				        #temp_arr.push(response.body)
				        comp = Nokogiri::HTML(response.body)
						comp.encoding = "utf-8"


						ico = comp.xpath('//span[contains(text(), "IČO: ")]/following-sibling::*').text
						icdph = comp.xpath('//span[contains(text(), "IČ DPH: ")]/following-sibling::*').text
						dic = comp.xpath('//span[contains(text(), "DIČ: ")]/following-sibling::*').text
						address = comp.xpath("//*[@class=\"Address\"]").text
						phones = comp.xpath("//*[@class=\"col-md-6 col-lg-3 tdtel\"]/*")
						emails = comp.xpath("//*[@class=\"col-md-6 col-lg-3 tdmail\"]/*")
						webs = comp.xpath("//*[@class=\"col-md-6 col-lg-3 tdweb\"]/*")

						naces = comp.xpath('//div[contains(text(), "Odborová klasifikácia NACE:")]/following-sibling::*')

						phones_arr = Array.new
						phones.each do |phone|
							phones_arr.push(phone.text)
						end

						emails_arr = Array.new
						emails.each do |email|
							emails_arr.push(email.text)
						end

						webs_arr=Array.new
						webs.each do |web|
							webs_arr.push(web.text)
						end

						naces_arr=Array.new
						if naces.present?
							naces[0].xpath('tr/*').each do |nace|
								naces_arr.push(nace.text)
							end
						end

						hh=Hash.new
						hh[:ico] = ico
						hh[:icdph] = icdph
						hh[:dic] = dic
						hh[:address] = address
						hh[:emails] = emails_arr
						hh[:phones] = phones_arr
						hh[:webs] = webs_arr
						hh[:naces] = naces_arr

						company.data = hh
						company.save
						

						
				     elsif response.timed_out?

				     	puts "response timed out" + response.effective_url
				     elsif response.code == 0

				     	puts response.return_message
				     else

				     # 	pp response
				     puts "HTTP request failed: " + response.code.to_s
				     if response.code == 404
				     	hh=Hash.new
				     	hh[:response] = 404
				     	company.data = hh
				     	company.save
				     end
				 end


				    #puts response.body
				end #end of request complete
				hydra.queue(request)


  		end
  		print "\r downloading #{i} from #{total}"
  		hydra.run




  	end

  end





  desc "this task download data from edb.sk"
  task download_companies: :environment do
  	baseurl = 'https://www.edb.sk'

  	agent = Mechanize.new
	agent.user_agent_alias = 'Windows Mozilla'
	agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
	page = agent.get(baseurl)

	body = page.body


	doc = Nokogiri::HTML(body)
	doc.encoding = "utf-8"
	
	items = doc.xpath("//*[@class=\"GAIndexCatalogCPV\"]")

	#puts items
	categories = Array.new

	items.each do |item|
		hh=Hash.new
		hh[:category_link] = item.xpath('@href').to_s
		hh[:category_name] = item.text

		categories.push(hh)
	end

	
	categories_in_db = ExternalCompany.all.pluck(:category)	

	categories.each do |category|
		#if ['Bezpečnosť a ochrana','Nábytok a interiéry','Doprava, preprava a skladovanie','Ekologické služby,čistenie a odpady','Elektro prístroje a materiál','Reality','Poľnohospodárstvo','Internet, software, IT','Kultúra, šport, voľný čas','Financie, banky, poisťovne'].include?(category[:category_name].to_s)
		if categories_in_db.include?(category[:category_name].to_s)
			puts "nasiel som uz kategoriu #{category[:category_name]}"
			next
		end

		puts "idem tahat kategoriu #{category[:category_name]}"
		puts Time.now

		
		#Typhoeus::Config.user_agent = "Windows Mozilla"
		#request = Typhoeus::Request.new(tt["suburl"],method: :get,:followlocation => true,cookiefile: filepath, cookiejar: filepath)

		

				first_page = agent.get(baseurl+category[:category_link].to_s)
			 	first_body = first_page.body
			 	first_doc = Nokogiri::HTML(first_body)
			 	first_doc.encoding = "utf-8"

			 	# first_items = first_doc.xpath("//*[@class=\"CoName\"]")

			 	# first_items.each do |item|
			 	# 	company = ExternalCompany.new(:name=>item.text, :url=>item.xpath('@href').to_s,:category=>category, :web_source=>'edb.sk')
			 	# 	companies.push(company)
			 	# end

			 	total = first_doc.xpath("//*[@class=\"inforesult\"]").text.split('/').second.split(' ').second.to_i


		hydra = Typhoeus::Hydra.new(max_concurrency: 10)
		#start = 0

		(0..total).each_slice(200) do |slice|
			puts  "processing #{slice.first} of #{total}"
			companies = Array.new

		rand(3) do |random|
			sleep(random)
		end

		#0.step(total,20) do |j|
		(slice.first).step(slice.last,20) do |j|
		

			#start.step(j,20) do |i|

			#	next if start == i
					
		#i=0
		#while finish_this == false 

			Typhoeus::Config.user_agent = "Windows Mozilla"

			request = Typhoeus::Request.new((baseurl+category[:category_link].to_s + "/?page="+j.to_s),
				method: :get,
				#:followlocation => true,
				#:verbose=>true,
				ssl_verifyhost: 0,
                 ssl_verifypeer: false,
				 cainfo: OpenSSL::X509::Certificate.new(File.read Rails.root.join('curl_cert/').join("example.crt")),
                 sslkey: OpenSSL::PKey::RSA.new(File.read Rails.root.join('curl_cert/').join("example.key"))
                 )

			#category_page = agent.get(baseurl+category[:category_link].to_s + "/?page="+i.to_s)

			###hydra part
			request.on_complete do |response|

						if response.success?
				        #	pp response.effective_url

				        #temp_arr.push(response.body)
				        cat_doc = Nokogiri::HTML(response.body)
						cat_doc.encoding = "utf-8"

						cat_items = cat_doc.xpath("//*[@class=\"CoName\"]")
						#puts "velkost cat items #{cat_items.size}"

						cat_items.each do |item|
						    company = ExternalCompany.new(:name=>item.text, :url=>item.xpath('@href').to_s,:category=>category[:category_name], :web_source=>'edb.sk')
							companies.push(company)
						end

				        # pp result

				     elsif response.timed_out?

				     	puts "response timed out" + response.effective_url
				     elsif response.code == 0

				     	puts response.return_message
				     else

				     # 	pp response
				     puts "HTTP request failed: " + response.code.to_s
				 end


				    #puts response.body
				end #end of request complete
				hydra.queue(request)

		
		print  "\r downloading by hydra #{j/20}"
		

		end #end of 100step

		hydra.run


		if companies.present?
			companies = companies.uniq
			puts "---"
				puts "importing  #{companies.size.to_s } companies for category: #{category}" + Time.now.to_s

				#companies = companies.uniq

				#puts "po unique mame velkost #{companies.size.to_s}"

				

				ExternalCompany.import companies, on_duplicate_key_update: {conflict_target: [:url], columns: [:name ,:web_source,:category ]}	
				puts "imported" + Time.now.to_s
				else
				puts "no data to insert!"
			end
		end #end of each slice 200

	end

  end
end