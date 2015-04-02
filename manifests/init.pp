class npsradius (
  $policyname     = $npsradius::params::policyname,
  $allowedgroups  = $npsradius::params::allowedgroups,
  $clients        = $npsradius::params::clients,
  $configtemplate = $npsradius::params::configtemplate,
  $tempfile       = $npsradius::params::tempfile,
) inherits npsradius::params {

  if !$allowedgroups {
    fail('No allowed groups were specified')
  }

  if !$clients {
    fail('No RADIUS clients were supplied')
  }

  class { 'npsradius::config'}

}
