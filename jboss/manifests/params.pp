# == Class: jboss::params
#
class jboss::params {
  $java = 'default-jdk'
  $temp_dir = '/tmp/'
  $jboss_package = 'wildfly-14.0.1.Final.zip'
  $jboss_url = 'http://download.jboss.org/wildfly/14.0.1.Final/wildfly-14.0.1.Final.zip'
}
