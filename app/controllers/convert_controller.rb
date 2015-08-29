class ConvertController < ApplicationController
 require 'open-uri'
 require 'rexml/document'
 require 'openssl'
 include REXML

 def result

		

	currency = params["money"]
	currency_text = params["text"]
	result = open("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22"+currency+"%22)&env=store://datatables.org/alltableswithkeys",:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read


	xmldoc = Document.new(result)


	xmldoc.elements.each("query/results/rate"){ 


	   |e| 
	   if e.attributes["id"] == currency
	   	@currency_text = currency_text
	   	@rate =  e.elements["Rate"].text
	   else
	    puts "failed"	
	   end

	}
 end
end