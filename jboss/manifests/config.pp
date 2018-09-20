# == Class: jboss::config
#
class jboss::config (
  )
{
  exec { 'Set env variables':
    command => "export JAVA_HOME=/usr/java/j2sdk10.0.2; export PATH=$PATH:$JAVA_HOME/bin",
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
} 
