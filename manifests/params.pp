class npsradius::params {

  case $::osfamily {
    'windows': {
      $policyname     = 'Puppet Controlled Policy'
      $allowedgroups  = undef
      $clientname     = undef
      $clientip       = undef
      $clientsecret   = undef
      $configtemplate = 'npsradius/npsradius.xml.erb'
    }

    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
