#
# Cookbook Name:: geonames_importer
# Attributes:: default
#
# Copyright 2013, Botond Dani
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# define mysql connection defaults
default['geonames_importer']['mysql_host'] = 'localhost'
default['geonames_importer']['mysql_port'] = node['mysql']['port']
default['geonames_importer']['mysql_user'] = 'root'
default['geonames_importer']['mysql_passwd'] = node['mysql']['server_root_password']
default['geonames_importer']['mysql_dbname'] = 'geonames'
default['geonames_importer']['connection'] = "-u#{node['geonames_importer']['mysql_user']} -p#{node['geonames_importer']['mysql_passwd']} -h#{node['geonames_importer']['mysql_host']} -r#{node['geonames_importer']['mysql_port']} -n#{node['geonames_importer']['mysql_dbname']}"

# define git repo defaults
default['geonames_importer']['repository'] = 'https://github.com/codigofuerte/GeoNames-MySQL-DataImport.git'
default['geonames_importer']['branch'] = 'master'
default['geonames_importer']['dir'] = '/usr/share/geonames-importer'