# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'
require 'csv'

Capybara.default_selector = :xpath
Capybara.default_driver = :selenium
Capybara.app_host = "https://twitter.com/search-home"

module Spider
	class Twitter
		include Capybara::DSL

		def search
			visit('')
			all("//ul[@class='trend-items js-trends']/li/a").each do |element|
				filename = "twitter/twitter_trends.csv"
				puts element.text
				time = Time.now	
				puts time			
				word = element.text
				data = [[time, word, element[:href]]]
				CSV.open(filename, "a") do | writer |
				  data.each do | item |
				    writer << item
				  end
				end

			end
		end

	end
end

spider = Spider::Twitter.new
spider.search

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

