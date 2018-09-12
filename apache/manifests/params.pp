class apache::params {
  $user_name = hiera("user_name")
  $group_name = hiera('group_name')
  $user_id = hiera(user_id)
  $group_id = hiera(group_id)
  $index_html = hiera(index_html)
  $dir_html = hiera(dir_html)
  $user_home = hiera(user_home)
  $package = hiera(package)
  $service = hiera(service)
  $mode = hiera(mode)
  $httpd_conf = hiera(httpd_conf)
  }
