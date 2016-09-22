class { '::mysql::server':
  root_password    => 'strongpassword',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
}
mysql_database { 'test_mdb':
  ensure  => present,
  charset => 'utf8',
}
mysql_user { 'test_user@localhost':
  ensure => present,
  max_connections_per_hour => '1000',
  max_queries_per_hour     => '1000',
  max_updates_per_hour     => '1000',
  max_user_connections     => '10',
}
mysql_grant { 'test_user@localhost/test_mdb.*':
  ensure      => present,
  options     => ['GRANT'],
  privileges  => ['SELECT', 'UPDATE'],
  table       => 'test_mdb.*',
  user        => 'test_user@localhost',
}
#node puppetstandalone.minsk.epam.com {
#include '::mysql::server'
#}
