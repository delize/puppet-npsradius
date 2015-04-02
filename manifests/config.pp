class npsradius::config (
  $tempfile       = $npsradius::tempfile,
  $configtemplate = $npsradius::configtemplate,
) {

  file { $tempfile:
    ensure  => present,
    content => template($configtemplate),
  }

  exec { 'checkandsetpolicybyname':
    command  => template('npsradius/correctconfig.ps1'),
    unless   => template('npsradius/checkconfig.ps1'),
    provider => powershell,
  }

}
