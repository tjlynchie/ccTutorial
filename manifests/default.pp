exec {"apt-get update":
path => "/usr/bin",
}
package {"apache2":
ensure => present,
 require => Exec["apt-get update"],
 }
service {"apache2":
 ensure => "running",
 require => Package["apache2"],
 }
file {"/var/www/project1":
 ensure => "link",
 target => "/vagrant/project1",
 require => Package["apache2"],
 notify => Service["apache2"],
 }