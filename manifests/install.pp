class stratis::install inherits stratis {

  if($stratis::manage_package)
  {
    package { $stratis::params::package_name:
      ensure => $stratis::package_ensure,
    }
  }

}
