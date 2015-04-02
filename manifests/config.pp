class npsradius::config (
  $tempfile       = $npsradius::tempfile,
  $configtemplate = $npsradius::configtemplate,
) {

  file { $tempfile:
    ensure  => present,
    content => template($configtemplate),
  }

  exec { 'checkandsetconfig':
    command  => template('npsradius/setconfig.ps1'),
    unless   => template('npsradius/checkconfig.ps1'),
    provider => powershell,
  }

}
