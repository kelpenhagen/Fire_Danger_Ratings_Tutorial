# make sure you run "bundle exec irb" not just irb


# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new
#
# # Read in a page
page = agent.get("http://www.rfs.nsw.gov.au/fire-information/fdr-and-tobans")

fire_area = {
	name: page.at(".danger-ratings-table").at(:tbody).search(:tr).first.search(:td).first.text,
	today_fire_d: page.at(".danger-ratings-table").at(:tbody).search(:tr).first.search(:td)[1].text,
	today_toban: page.at(".danger-ratings-table").at(:tbody).search(:tr).first.search(:td)[2].text,
	tomorrow_fire_d: page.at(".danger-ratings-table").at(:tbody).search(:tr).first.search(:td)[3].text,
	tomorrow_toban: page.at(".danger-ratings-table").at(:tbody).search(:tr).first.search(:td)[4].text,
	council: page.at(".danger-ratings-table").at(:tbody).search(:tr).first.search(:td)[5].text
}

# # Find somehing on the page using css selectors
p fire_area
#
# # Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".
