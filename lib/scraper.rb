require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open("./fixtures/student-site/index.html"))
    html_card = html.css(".student-card")
    binding.pry
    html_card.collect do |person|
      student = Student.new
      student.name = person.css(".student-name").text
      student.location = person.css(".student-location").text
      student.url = person.css("a").href
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

