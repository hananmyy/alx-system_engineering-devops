# Puppet manifest to install Nginx and add a custom response header with the server hostname

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/custom_default.erb'),
  notify  => Service['nginx'],
}
