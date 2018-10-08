# == Class: jboss:install
class jboss::install (
  $java = $jboss::java,
  $temp_dir = $jboss::temp_dir,
  $jboss_package = $jboss::jboss_package,
  $jboss_url = $jboss::jboss_url
  )
{
#  file { "/tmp/${java}":
#    ensure => file,
#    mode => '0777',
#    #path => "${temp_dir}/${java}",
#    source => "puppet:///modules/jboss/${java}"
#  }
#  exec { 'install java JDK':
#    command => "rpm -i /tmp/${java}",
#    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
#    #cwd => $temp_dir,
#    require => File["/tmp/${java}"]
package { '$java':
  ensure => present,
}
#  file { '$jboss_package':
#    ensure => file,
#    mode => '0644',
#    source => "puppet:///modules/jboss/${jboss_package}"
#  }
exec { "Download Jboos":
  command => "wget ${jboss_url}",
  path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  #refreshonly => true,
  cwd     => $temp_dir,
  creates => "${temp_dir}/wildfly-14.0.1.Final.zip"
}
#  exec { 'extract jboss':
#    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
#    unless => 'test -f $jboss_package',
#    cwd => $temp_dir,
#    require => File['$jboss_package']
#  }
}
