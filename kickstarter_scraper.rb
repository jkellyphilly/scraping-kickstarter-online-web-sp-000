# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}
  # projects: kickstarter.css("li.project.grid_4")
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text.strip (removes the new line characters)
  # location: project.css("ul.project-meta li a").text.strip
  # percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
  #binding.pry

  kickstarter.css("li.project.grid_4") each do |project|

    # Grab the title of the project and use it as the key to this project
    title = project.css("h2.bbcard_name strong a".text)
    projects[title.to_sym] = {}

  end

  projects
end

create_project_hash
