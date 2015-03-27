class npsradius::params {

  case $::osfamily {
    'windows': {
      $policyname          = "Puppet Controlled Policy"
      $allowedgroupsid     = undef
      $clientname          = undef
      $clientip            = undef
      $clientsecret        = undef
    }

    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
