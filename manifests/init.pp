class plex-server {
    if $operatingsystem = 'Ubuntu' {
        include apt
        apt::source { "plex":
            location => "http://plexapp.com/repo",
            release => "lucid",
            repos => "main",
            include_src => false,
            required_packages => "plex-archive-keyring",
    #        key => "43525C28E533491A",
    #        key_server => "subkeys.pgp.net",
            pin => "500"
        }   
        package { 'plexmediaserver':
            ensure  => present,
            require => Apt::Source['plex'],
        }
    }
}
