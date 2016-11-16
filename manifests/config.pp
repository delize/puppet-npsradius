class npsradius::config (
  $configfile     = $npsradius::configfile,
  $exportfile     = $npsradius::exportfile,
  $configtemplate = $npsradius::configtemplate,
) {

  file { $configfile:
    ensure  => present,
    content => template($configtemplate),
  }

  exec { 'npsradius-checkandconfig':
    command   => template('npsradius/setconfig.ps1'),
    unless    => template('npsradius/configsmatch.ps1'),
    provider  => windows,
    require   => File[$configfile],
    logoutput => true,
  }

}
