#! /usr/bin/env ruby
# https://nokogiri.org/#native-gems-faster-more-reliable-installation
require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))

# Search for nodes by css
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end

# Search for nodes by xpath
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end

# Or mix and match
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end
