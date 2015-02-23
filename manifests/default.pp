exec {"apt-get update":
path=> "usr/bin",
}
package {"apache2": ensure => present, require => Exec["apt-get udpate"],}
service {"apache2": ensure => present, require => Package["apache2"],}
file {"var/www/project1": ensure => "link", target => Package["apache2"], notify => Service["apache2"],}