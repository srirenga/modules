# == Class: jboss:install
class jboss::install (
  $java = $jboss::java,
  $temp_dir = $jboss::temp_dir,
  $jboss_package = $jboss::jboss_package
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
package { 'default-jdk':
  ensure => present,
}
#  file { '$jboss_package':
#    ensure => file,
#    mode => '0644',
#    source => "puppet:///modules/jboss/${jboss_package}"
#  }
exec { "Download Jboos":
  command => 'wget http://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.zip',
  path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  #refreshonly => true,
  cwd     => '/tmp',
  creates => '/tmp/wildfly-14.0.1.Final.zip'
}
#  exec { 'extract jboss':
#    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
#    unless => 'test -f $jboss_package',
#    cwd => $temp_dir,
#    require => File['$jboss_package']
#  }
}
