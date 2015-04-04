class npsradius::config (
  $configfile     = $npsradius::configfile,
  $exportfile     = $npsradius::exportfile,
  $configtemplate = $npsradius::configtemplate,
) {

  file { $configfile:
    ensure  => present,
    content => template($configtemplate),
  }

  exec { 'checkandsetconfig':
    command   => template('npsradius/setconfig.ps1'),
    unless    => template('npsradius/configsmatch.ps1'),
    provider  => powershell,
    require   => File[$configfile],
    logoutput => true,
  }

}
