require "nokogiri"
require "open-uri"

# page = Nokogiri::HTML(URI.open("http://en.wikipedia.org/"))
# puts page.class
# page = Nokogiri::HTML(URI.open("http://ruby.bastardsbook.com/files/hello-webpage.html"))
# puts page.css('title')
# puts page.css('li')
# puts page.css('li')[0].text
# puts page.css('li a')[1]['href']
# puts page.css('li a[data-category]')
# puts page.css('li a[href]')
# puts page.css('div#funstuff')
# puts page.css('div#references a')
# a = page.css('div#references a')
# a.each { |a| puts a['href'], a.text  }
# links = page.css('a').select{|l| l['data-category']=='news'}
# links.each { |l| puts l['href']  }
# links = page.css('a[data-category="news"]')
# links.each { |l| puts l['href']  }
# puts page.css('p').css('a')
# .infobox > tbody > tr > th > a
# p = Nokogiri::HTML(URI.open("https://en.wikipedia.org/wiki/HTML"))
# p.css(".infobox > tbody > tr > th").each { |e| puts e.text  }
# .entry-content > table > tbody > tr > td
# .entry-content > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2)
p = Nokogiri::HTML(URI.open("https://1000mostcommonwords.com/1000-most-common-russian-words/"))
# p.css(".entry-content > table > tbody > tr").each { |e| puts "en=#{e.css('td:nth-child(3)').text}"  }
p.css(".entry-content > table > tbody > tr").each do |e|
  # puts "en=#{e.css('td:nth-child(3)').text}"
    # puts "no print"
    # puts "en=#{e.css('td:nth-child(3)').text}" unless e.css('td:nth-child(3)').text == 'in English'
    puts "en=#{e.css('td:nth-child(2)').text}" unless e.css('td:nth-child(2)').text == 'Russian'
end
