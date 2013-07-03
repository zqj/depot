set :user, 'ruby'
set :use_sudo, false
set :domain, '223.5.23.49'
set :application, "depot"
set :repository,  "https://github.com/zqj/depot.git"

set :deploy_to, "/home/ruby/production"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

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