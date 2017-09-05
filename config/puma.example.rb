# Directory that puma operates out of.
directory       '/home/deploy/nudeangels/current'

# The PID file location.
pidfile         '/home/deploy/nudeangels/current/tmp/pids/puma.pid'

# State and configuration parameters of Puma process.
state_path      '/home/deploy/nudeangels/current/tmp/pids/puma.state'

# Redirect STDOUT to STDERR.
stdout_redirect '/home/deploy/nudeangels/current/log/puma.log',
                '/home/deploy/nudeangels/current/log/puma.log',
                true

# Do not daemonize the Puma process on JRuby. Faulty.
# Instead background the puma start process.
daemonize       false

# Bind TCP to all network interfaces and port 9000.
bind            'unix:///home/deploy/nudeangels/current/tmp/sockets/puma.sock'

# Puma threads, minimum of 1, maximum of 8
threads         1, 8

# Production environment configuration (for OpenBEL API application).
environment     'production'

# The OpenBEL API rack app to start.
rackup          '/home/deploy/nudeangels/current/config.ru'
