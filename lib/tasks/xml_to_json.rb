require 'nokogiri'
@nokogiri_object = Nokogiri::XML(File.open('/lib/srml-24-2014-f752007-matchresults.xml'))
Hash.from_xml(@nokogiri_object.to_xml).to_json
