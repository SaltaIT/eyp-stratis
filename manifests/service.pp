class stratis::service inherits stratis {

  #
  validate_bool($stratis::manage_docker_service)
  validate_bool($stratis::manage_service)
  validate_bool($stratis::service_enable)

  validate_re($stratis::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${stratis::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $stratis::manage_docker_service)
  {
    if($stratis::manage_service)
    {
      service { $stratis::params::service_name:
        ensure => $stratis::service_ensure,
        enable => $stratis::service_enable,
      }
    }
  }
}
