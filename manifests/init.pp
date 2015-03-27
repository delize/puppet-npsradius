class npsradius (
  $policyname       = $npsradius::params::policyname,
  $allowedgroupsid  = $npsradius::params::allowedgroupsid,
  $clientname       = $npsradius::params::clientname,
  $clientip         = $npsradius::params::clientip,
  $clientsecret     = $npsradius::params::clientsecret,
) inherits npsradius::params {

  if !$allowedgroupsid {
    fail("No allowed group SID was supplied")
  }

  if !$clientname {
    fail("No RADIUS client name was supplied")
  }

  file { "%TEMP%\\npsradius.xml":
    ensure   => present,
    contents => template("npsradius/npsradius.xml.erb"),
  }

}
