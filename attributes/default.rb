#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#<> Postgis Template Database: The name of the gis database template. Set to nil to disable the creation of the template.
default['postgis']['template_name'] = 'template_postgis'
#<> Postgis Template locale: The locale of the database.
default['postgis']['locale'] = 'en_US.utf8'

case node['platform_family']
when 'fedora', 'rhel', 'centos'
  default['postgis']['package'] = 'postgis'
when 'debian'
  if node['platform'] == 'ubuntu' && node['platform_version'].to_f <= 12.04
    default['postgis']['package'] = 'postgresql-9.1-postgis2'
  elsif node['platform'] == 'ubuntu' && node['platform_version'].to_f <= 14.04
    default['postgis']['package'] = 'postgresql-9.3-postgis-2.1'
  else
    default['postgis']['package'] = 'postgresql-9.5-postgis-2.3'
  end
end
