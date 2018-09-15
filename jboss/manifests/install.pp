# == Class: jboss:install
class jboss::install (
  $java = $jboss::java,
  $temp_dir = $jboss::temp_dir,
  $jboss_package = $jboss::jboss_package
  )
{
  file { $java:
    ensure => file,
    mode => '0777',
    path => "${temp_dir}/${java}",
    source => "puppet:///modules/jboss/${java}"
  }->
  exec { 'install java JDK':
    command => "rpm -i ${java}",
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    cwd => $temp_dir
  }->
  file { '$jboss_package':
    ensure => file,
    mode => '0644',
    path => "${temp_dir}/${jboss_package}",
    source => "puppet:///modules/jboss/${jboss_package}"
  }->
  exec { 'extract jboss':
    command => "tar -xvzf ${jboss_package}",
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    unless => 'test -f $jboss_package',
    cwd => $temp_dir
  }
}
