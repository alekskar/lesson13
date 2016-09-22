class t13::mysql {
  class { '::mysql::server':
    root_password    => 'strongpassword',
    override_options => { 'mysqld' => { 'max_connections' => '1024' } }
  }
  mysql_database { 'prod_mdb':
    ensure  => present,
    charset => 'utf8',
  }
  mysql_user { 'prod_user@localhost':
    ensure => present,
    max_connections_per_hour => '1000',
    max_queries_per_hour     => '1000',
    max_updates_per_hour     => '1000',
    max_user_connections     => '10',
  }
  mysql_grant { 'prod_user@localhost/prod_mdb.*':
    ensure      => present,
    options     => ['GRANT'],
    privileges  => ['SELECT', 'UPDATE'],
    table       => 'prod_mdb.*',
    user        => 'prod_user@localhost',
  }
}
