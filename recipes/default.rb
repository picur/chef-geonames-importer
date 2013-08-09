#
# Cookbook Name:: chef-geonames-importer
# Recipe:: default
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

# install geonames_importer from git
git node[:geonames_importer][:dir] do
    repository node[:geonames_importer][:repository]
    reference node[:geonames_importer][:branch]
    action :sync
    notifies :run, "execute[download_geonames_dumps]"
end

# download geonames.org public data
execute "download_geonames_dumps" do
    command "/bin/bash geonames_importer.sh -a download-data"
    cwd node[:geonames_importer][:dir]
    user "root"
    group "root"
end

# create database if not exists
execute "create_geonames_database" do
    command "/bin/bash geonames_importer.sh -a create-db #{node[:geonames_importer][:connection]}"
    cwd node[:geonames_importer][:dir]
    user "root"
    group "root"
end

# import geonames.org downloaded data
execute "import_geonames_dumps" do
    command "/bin/bash geonames_importer.sh -a import-dumps #{node[:geonames_importer][:connection]}"
    cwd node[:geonames_importer][:dir]
    user "root"
    group "root"
end