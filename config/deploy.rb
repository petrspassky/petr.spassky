# config valid only for current version of Capistrano
lock '3.9.1'

set :application, 'nudeangels'
set :repo_url, 'git@github.com:petrspassky/petr.spassky.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true,
#     log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files,
       'config/database.yml',
       'config/secrets.yml',
       'config/newrelic.yml',
       'config/puma.rb'

# Default value for linked_dirs is []
append :linked_dirs,
       'log',
       'tmp/pids',
       'tmp/cache',
       'tmp/sockets',
       'public/system',
       'node_modules'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# RVM settings
set :rvm_type, :user

# Reload puma once fineshed
after 'deploy:finished', 'service:puma:reload'

# Inform new-relic
after 'deploy:updated', 'newrelic:notice_deployment'
