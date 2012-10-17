# Author:: Takashi Kanai (<anikundesu@gmail.com>)
# Copyright:: Copyright (c) 2012 IDC Frontier Inc.
# License:: Apache License, Version 2.0
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


version = '0.2.16'

git '/tmp/knife-cloudstack-fog' do
  repository 'https://github.com/anikundesu/knife-cloudstack-fog.git'
  action :checkout
end

execute 'gem build knife-cloudstack-fog' do
  command 'gem build knife-cloudstack-fog.gemspec'
  cwd '/tmp/knife-cloudstack-fog'
  action :run
end

gem_package 'knife-cloudstack-fog' do
  source "/tmp/knife-cloudstack-fog/knife-cloudstack-fog-#{version}.gem"
  action :install
end
