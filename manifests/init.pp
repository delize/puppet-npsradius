class npsradius (
  $policyname       = $npsradius::params::policyname,
  $allowedgroups    = $npsradius::params::allowedgroups,
  $clientname       = $npsradius::params::clientname,
  $clientip         = $npsradius::params::clientip,
  $clientsecret     = $npsradius::params::clientsecret,
) inherits npsradius::params {

  if !$allowedgroups {
    fail("No allowed groups were specified")
  }

  if !$clientname {
    fail("No RADIUS client name was supplied")
  }

  file { "C:/Windows/Temp/npsradius.xml":
    ensure   => present,
    content  => template("npsradius/npsradius.xml.erb"),
  }

}
