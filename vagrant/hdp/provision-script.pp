exec { "apt-update":
	command => "/usr/bin/apt-get update"
}

package { 'unzip':
	ensure => installed,
	require => Exec["apt-update"]
}

package { 'mysql-server':
	ensure => installed,
	require => Exec["apt-update"]
}

service { "mysql":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["mysql-server"]
}

exec { "createdatabase-hdp":
	command => "mysqladmin -uroot create hdp",
	unless => "mysql -uroot hdp"
	path => "/usr/bin",
	require => Service["mysql"]
}
