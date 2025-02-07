 # -*- coding: utf-8 -*-                                                        
require 'open-uri'
require 'nokogiri'
require "date"
require 'csv'
atom = open('http://www.google.co.jp/trends/hottrends/atom/hourly')
doc = Nokogiri::HTML(atom)
#puts doc                                                                       
dt = Date.today	
filename = "google_trends/google_trends.csv"
#outfile = File.open(filename, 'a')
doc.xpath("/html/body/feed/entry/content/li/span/a").each {|element|
	time = Time.now
	puts time
	puts element.text
        puts element[:href]
	word = element.text
	data = [[time, word, element[:href]]]
	CSV.open(filename, "a") do | writer |
	  data.each do | item |
	    writer << item
	  end
	end
}


# 追記をサポートするように改造。
class << CSV
  alias_method( :open_org, :open )
  
  def open( path, mode, fs=nil, rs=nil, &block )
    if mode == "a" || mode == "ab"
      open_writer( path, mode, fs, rs, &block)
    else
      open_org( path, mode, fs=nil, rs=nil, &block )
    end
  end
end
