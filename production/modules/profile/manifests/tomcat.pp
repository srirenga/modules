# == Class: infra::tomcat

class profile::tomcat {
  group { 'tomcat':
    gid => 1500,
  }
  user { 'tomcat':
    ensure     => present,
    home       => '/home/tomcat',
    comment    => 'First Last',
    shell      => '/bin/false',
    uid        => '1501',
    gid        => '1500',
    groups     => 'tomcat',
    managehome => true,
  }
  exec { 'Download tomcat':
    command => 'wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.zip',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    #refreshonly => true,
    cwd     => '/home/sri/Documents',
    creates => '/home/sri/Documents/apache-tomcat-8.5.34.zip',
  }
  file { 'Install Dir':
    ensure => directory,
    name   => '/opt',
    owner  => 'tomcat',
    group  => 'tomcat',
    mode   => '0755',
  }
  archive { 'xtract tomcat':
    path         => '/home/sri/Documents/apache-tomcat-8.5.34.zip',
    extract      => true,
    extract_path => '/opt',
    creates      => '/opt/apache-tomcat-8.5.34/bin',
    user         => 'tomcat',
    group        => 'tomcat',
    require      => Exec['Download tomcat'],
  }
}
