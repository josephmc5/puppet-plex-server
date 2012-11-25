class plex-server inherits plex-server::params {
    if $operatingsystem == 'Ubuntu' {
        include apt
        apt::source { "plexmediaserver":
            location => "http://plexapp.com/repo",
            release => "lucid",
            repos => "main",
            include_src => false,
            required_packages => "plex-archive-keyring",
    #        key => "43525C28E533491A",
    #        key_server => "subkeys.pgp.net",
            pin => "500"
        }   
#        user { "$services_user":
#            allowdupe => false,
#            ensure => 'present',
#        }
        package { 'plexmediaserver':
            ensure  => present,
            require => Apt::Source['plexmediaserver'],
        }
        service { 'plexmediaserver':
            ensure => running,
        }
        file { 'plex-dir':
            ensure => directory,
            path => "$base_dir/plexmediaserver",
            owner => "$services_user",
            group => "$services_user",
            mode => '0744',
        }
        file { 'plex-data-dir':
            ensure => directory,
            path => "$base_dir/plexmediaserver/data",
            owner => "$services_user",
            group => "$services_user",
            mode => '0744',
            require => File['plex-dir'],
        }
        file { 'plex-config':
            ensure => present,
            path   => '/etc/default/plexmediaserver',
            content => template('plex-server/plexmediaserver.erb'),
            owner => "$services_user",
            group => "$services_user",
            mode => '0644',
            require => File['plex-data-dir'],
            notify => Service['plexmediaserver'],
        }
    }
}
