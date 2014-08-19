vimsetup Cookbook
=================
This cookbook install vim with lua plugin etc, and neobundle
(https://github.com/Shougo/neobundle.vim)

Requirements
------------

#### packages
- vim
- git

Attributes
----------

#### vimsetup::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['vimsetup']['user']</tt></td>
    <td>String</td>
    <td>user to make .vim directory </td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td><tt>['vimsetup']['group']</tt></td>
    <td>String</td>
    <td>group to make .vim directory </td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td><tt>['vimsetup']['home']</tt></td>
    <td>String</td>
    <td>home directory to make .vim directory </td>
    <td><tt>/home/vagrant</tt></td>
  </tr>
</table>

Usage
-----

#### vimsetup::default
include `vimsetup` in your `run_list`:
this recipe install vim with lua, ruby, python, perl plugins.

#### vimsetup::neobundle
include `vimsetup::neobundle` in your `run_list`:
this recipe install neobundle in `node['vimsetup']['home']/.vim/bundle`

#### vimsetup::alias
include `vimsetup::alias` in your `run_list`:
this recipe add `alias vi='vim'` in `node['vimsetup']['user']`'s .bashrc

License and Authors
-------------------
Author: Nobuyuki Matsui nobuyuki.matsui@gmail.com

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
