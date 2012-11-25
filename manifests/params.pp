class plex-server::params (
    $base_dir = hiera("app_dir", "/opt"),
    $music_dir = hiera("music_dir"),
    $external_dns = hiera("external_dns", "localhost"),
    $proxy_nginx = hiera("proxy_nginx", "false"),
    $proxy_apache = hiera("proxy_apache", "false"),
    $logrotate = hiera("logrotate", "false"),
)
{
    $services_user = hiera("services_user")
    $log_dir = "$base_dir/plexmediaserver/log"
    $data_dir = "$base_dir/plexmediaserver/data"
    $cache_dir = "$base_dir/plexmediaserver/cache"
}
