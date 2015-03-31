class npsradius (
  $policyname     = $npsradius::params::policyname,
  $allowedgroups  = $npsradius::params::allowedgroups,
  $clients        = $npsradius::params::clients,
$233  99configtemplate => $npsradius::params::configtemplate,
) inherits npsradius::params {

  if !$allowedgroups {
    fail('No allowed groups were specified')
  }

  if !$clients {
    fail('No RADIUS clients were supplied')
  }

  file { 'C:/Windows/Temp/npsradius.xml':
    ensure  => present,
    content => template($configtemplate),
  }

}
