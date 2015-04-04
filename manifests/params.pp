class npsradius::params {

  case $::osfamily {
    'windows': {
      $policyname     = 'Puppet Controlled Policy'
      $allowedgroups  = undef
      $clients        = undef
      $configtemplate = 'npsradius/npsradius.xml.erb'
      $configfile     = 'C:/Windows/Temp/npsradiuspuppet.xml'
      $exportfile     = 'C:/Windows/Temp/npsradiusexport.xml'
    }

    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
