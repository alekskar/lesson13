class t13::nginx {
  package { 'nginx':
    ensure => installed
  }

  notify { 'Nginx is installed.':}

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }

  notify { 'Nginx is running.': }
}
