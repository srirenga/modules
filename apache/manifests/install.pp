class apache::install (
  $user_name = $apache::user_name,
  $group_name = $apache::group_name,
  $user_id = $apache::user_id,
  $group_id = $apache::group_id,
  $index_html = $apache::index_html,
  $dir_html = $apache::dir_html,
  $user_home = $apache::user_home,
  $package = $apache::package,
  $service = $apache::service,
  $mode = $apache::mode,
  $httpd_conf = $apache::httpd_conf,
)
{
group { $group_name:
  ensure => 'present',
  gid    => $group_id,
}

user { $user_name:
  ensure           => 'present',
  gid              => $group_id,
  groups           => $group_name,
  home             => $user_home,
  uid              => $user_id,
  managehome      => 'true',
  require          => Group[$group_name]
}
exec { "chmod ${mode} to ${dir_html}":
  command => "chmod -R ${mode} ${dir_html}; chmod -R ${mode} ${user_home}; chown -R ${user_name}:${group_name} ${dir_html}",
  path => '/bin/',
  require =>[ File["$dir_html/index.html"],File["${httpd_conf}/httpd.conf"]],
    }
file { "${dir_html}/index.html":
  ensure => 'file',
  content => template('apache/index.html.erb'),
  owner => $user_name,
  group => $group_name,
  mode => $mode,
  require => Service[$service]
  }

file { "${httpd_conf}/httpd.conf":
  ensure => 'file',
  #path
  content => template('apache/httpd.conf.erb'),
  owner => $user_name,
  group => $group_name,
  mode => $mode,
  require => Package[$package]
  }
package { $package:
  ensure => present
 }
service { $service:
  ensure => running,
  enable => true,
  require => [Package[$package],File["${httpd_conf}/httpd.conf"]]
 }
}
