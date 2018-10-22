# == Class: infra::java
#
class infra::java {
  package { 'default-jdk':
    ensure => present,
  }
}
