
#require File.join(File.dirname(__FILE__), 'deploy') + '/capistrano_database'


set :user, 'ruby'
set :password, 'wjb@49'
set :domain, '223.5.23.49'
set :application, "depot"
set :repository,  "https://github.com/zqj/depot.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_to, "/home/ruby/production3"
set :deploy_via, :remote_cache

role :web, "223.5.23.49"                          # Your HTTP server, Apache/etc
role :app, "223.5.23.49"                          # This may be the same as your `Web` server
role :db,  "223.5.23.49", :primary => true # This is where Rails migrations will run
role :db,  "223.5.23.49"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

set :use_sudo, false

set :bundle_dir,      File.join(fetch(:shared_path), 'bundle')
set :bundle_without,  [:development, :test]

task :search_libs, :hosts => "223.5.23.49" do
  run "ls -x1 /usr/lib | grep -i xml"
end



set :rvm_path,"/home/ruby/.rvm"
set :rvm_bin_path,"/home/ruby/.rvm/bin"
set :rvm_ruby_string, 'ruby-1.9.3-p448@rails32'
set :rvm_type, :system
require "rvm/capistrano"

require "bundler/capistrano"