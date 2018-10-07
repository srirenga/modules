# == Class: jboss::params
#
class jboss::params {
  $java = 'jdk-10.0.2_linux-x64_bin.rpm'
  $temp_dir = '/tmp/'
  $jboss_package = 'http://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.zip'
}
