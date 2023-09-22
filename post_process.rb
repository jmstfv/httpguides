# frozen_string_literal: true

# Remove the .html extension from sitemap URLs

require 'nokogiri'

begin
  xml = File.read('output/sitemap.xml')
  doc = Nokogiri::XML(xml)

  locs = doc.xpath('/ns:urlset/ns:url/ns:loc', 'ns' => 'http://www.sitemaps.org/schemas/sitemap/0.9')
  locs.each { |loc| loc.content = loc.content.gsub(/.html/, '') }

  File.write('output/sitemap.xml', doc.to_xml)
rescue SystemCallError => e
  puts e.message
end
