node puppetstandalone.minsk.epam.com {
  include '::ntp' 
  include '::mysql::server'
}
