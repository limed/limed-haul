include nubis_discovery

nubis::discovery::service { 'varnish':
  tcp      => 82,
  interval => '15s',
}

class {'varnish':
  varnish_listen_port  => 82,
  storage_type         => 'file',
  varnish_storage_size => '1G',
  varnish_storage_file => '/mnt/varnish_storage.bin',
}

class { 'varnish::vcl':
  # Send to Apache
  backends               => {
    'default' => {
      host => '127.0.0.1',
      port => '81'
    },
  },

  # Don't scrub headers
  unset_headers          => [ ],
  unset_headers_debugips => [ ],

  # More options
  cookiekeeps            => [
    'JSESSIONID[^=]*',
    'jenkins[^=]*',
  ],

  logrealip              => true,
  honor_backend_ttl      => true,
  x_forwarded_proto      => true,
  cond_requests          => true,
}
