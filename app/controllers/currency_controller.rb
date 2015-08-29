class CurrencyController < ApplicationController

 require 'open-uri'
 require 'rexml/document'
 require 'openssl'
 include REXML

 def root
  redirect_to home_pages_url
 end

 def test		

	currency = params["money"]
	@hehe = params["zara"]

	#render :text => hehe
	
	result = open("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22"+currency+"%22)&env=store://datatables.org/alltableswithkeys",:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read

	xmldoc = Document.new(result)

	xmldoc.elements.each("query/results/rate"){ 
	   |e|
	   if e.attributes["id"] == currency
	   	@value = e.elements["Name"].text
	   	@rate =  e.elements["Rate"].text

	   else
	    puts "failed"	
	   end

	}


 end

 def home
	
  	@greeting = "Currency Rates"
 end


end