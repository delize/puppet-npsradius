class npsradius (
  $policyname     = $npsradius::params::policyname,
  $allowedgroups  = $npsradius::params::allowedgroups,
  $clients        = $npsradius::params::clients,
  $configtemplate = $npsradius::params::configtemplate,
  $configfile     = $npsradius::params::configfile,
  $exportfile     = $npsradius::params::exportfile,
) inherits npsradius::params {

  if !$allowedgroups {
    fail('No allowed groups were specified')
  }

  if !$clients {
    fail('No RADIUS clients were supplied')
  }

  class { 'npsradius::config': }

}
