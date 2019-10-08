class stratis::params {

  $package_name=[ 'stratisd', 'stratis-cli' ]
  $service_name='stratisd'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^[8].*$/:
        {
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
