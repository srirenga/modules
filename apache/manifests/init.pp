# == Class: apache
#
# Full description of class apache here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'apache':
#    servers => [ 'pool.ntp.org' 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here unless otherwise noted.
#
class apache (
  $user_name = $apache::params::user_name,
  $group_name =$apache::params::group_name,
  $user_id = $apache::params::user_id,
  $group_id = $apache::params::group_id,
  $index_html = $apache::params::index_html,
  $dir_html = $apache::params::dir_html,
  $user_home = $apache::params::user_home,
  $package = $apache::params::package,
  $service = $apache::params::service,
  $mode = $apache::params::mode,
  $httpd_conf = $apache::params::httpd_conf,

) inherits apache::params {
  include apache::install
 }
