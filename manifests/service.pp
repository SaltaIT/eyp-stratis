class stratis::service inherits stratis {

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
