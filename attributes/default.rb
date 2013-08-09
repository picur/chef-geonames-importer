# define mysql connection defaults
default.geonames_importer.mysql_host	= 'localhost'
default.geonames_importer.mysql_port	= "#{node[:mysql][:port]}"
default.geonames_importer.mysql_user	= 'root'
default.geonames_importer.mysql_passwd	= "#{node[:mysql][:mysql_root_password]}"
default.geonames_importer.mysql_dbname	= 'geonames'
default.geonames_importer.connection	= "-uroot -p#{node[:geonames_importer][:mysql_passwd]} -h#{node[:geonames_importer][:mysql_host]} -r#{node[:geonames_importer][:mysql_port]} -n#{node[:geonames_importer][:mysql_dbname]}"

# define git repo defaults
default.geonames_importer.repository 	= 'https://github.com/codigofuerte/GeoNames-MySQL-DataImport.git'
default.geonames_importer.branch 		= 'master'
default.geonames_importer.dir 			= '/usr/share/geonames-importer'