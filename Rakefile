# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will
# automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :db do
  desc 'Drops and recreates DB with all the migrations and seeds'
  task :reset, 'db:drop', 'db:create', 'db:migrate', 'db:seed'
end
