# Puppet manifest to install Nginx, serve Hello World! at root, and redirect /redirect_me

package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  require => Package['nginx'],
  notify  => Service['nginx'],
  content => template('nginx/default.erb'),
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}