class stratis(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits stratis::params{

  class { '::stratis::install': }
  -> class { '::stratis::config': }
  ~> class { '::stratis::service': }
  -> Class['::stratis']

}
