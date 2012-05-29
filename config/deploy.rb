require 'bundler/capistrano'
load "deploy/assets"
default_run_options[:pty] = true

set :application, "alexsquest_blog"
set :repository, "git://github.com/kurko/blog.git"
set :deploy_to, proc { "/var/projects/#{application}" }

set :user, `whoami`.gsub(/\n/, "")
set :use_sudo, true
set :scm, :git
set :deploy_via, :remote_cache
set :scm_verbose, true
set :domain, "alexsquest.com"
role :web, domain.to_s
role :app, domain.to_s
role :db,  domain.to_s, :primary => true


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :setup_database do
  task :symlink_config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:finalize_update", "setup_database:symlink_config"
after "setup_database:symlink_config", "deploy:migrate"
