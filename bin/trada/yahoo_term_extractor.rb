#!/usr/bin/env ruby
require 'wrest'
require 'pp'




endpoint = "http://search.yahooapis.com/ContentAnalysisService/V1/termExtraction"


  params = {:appid => ENV['YAHOO_TERM_EXTRACTOR'], :output => 'json', :query => query, :context => context}
  result = endpoint.to_uri.get(params).deserialise
  pp result
end
