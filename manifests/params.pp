class npsradius::params {

  case $::osfamily {
    'windows': {
      $policyname     = 'Puppet Controlled Policy'
      $allowedgroups  = undef
      $clients        = undef
      $configtemplate = 'npsradius/npsradius.xml.erb'
      $tempfile       = 'C:/Windows/Temp/npsradius.xml'
    }

    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
