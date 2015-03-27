class npsradius (
  $policyname       = $npsradius::params::policyname,
  $allowedgroups    = $npsradius::params::allowedgroups,
  $clients          = $npsradius::params::clients,
) inherits npsradius::params {

  if !$allowedgroups {
    fail("No allowed groups were specified")
  }

  if !$clients {
    fail("No RADIUS clients were supplied")
  }

  file { "C:/Windows/Temp/npsradius.xml":
    ensure   => present,
    content  => template("npsradius/npsradius.xml.erb"),
  }

}
