name             'geonames_importer'
maintainer       'Botond Dani'
maintainer_email 'hi@danibotond.ro'
license          'MIT'
description      'Installs/Configures chef-geonames-importer'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 		 'mysql'

%w(ubuntu debian).each do |os|
	supports os
end