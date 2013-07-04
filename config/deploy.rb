#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---


# be sure to change these
set :user, 'ruby'
set :password, 'wjb@49'
set :domain, '223.5.23.49'
set :application, "depot"
set :repository,  "https://github.com/zqj/depot.git"

# adjust if you are using RVM, remove if you are not
#require "rvm/capistrano"

set :deploy_to, "/home/ruby/production2"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "223.5.23.49"                          # Your HTTP server, Apache/etc
role :app, "223.5.23.49"                          # This may be the same as your `Web` server
role :db,  "223.5.23.49", :primary => true # This is where Rails migrations will run
role :db,  "223.5.23.49"

require "rvm/capistrano"
set :rvm_path,"/home/ruby/.rvm"
set :rvm_bin_path,"/home/ruby/.rvm/bin"
set :rvm_ruby_string, 'ruby-1.9.3-p448@rails32'
set :rvm_type, :system
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))




set :default_environment, {
  'PATH' => "/home/ruby/.rvm/bin:/home/ruby/.rvm/rubies/ruby-1.9.3-p448/bin:$PATH",
  'RUBY_VERSION' => 'ruby 1.9.3',
  'GEM_HOME'     => '/home/ruby/.rvm/gems/ruby-1.9.3-p448@rails32/gems',
  'GEM_PATH'     => '/home/ruby/.rvm/gems/ruby-1.9.3-p448@rails32/gems',
  'BUNDLE_PATH'  => '/home/ruby/.rvm/gems/ruby-1.9.3-p448@rails32/gems'  # If you are using bundler.
}

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
after "deploy", "rvm:trust_rvmrc"

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

# you might need to set this if you aren't seeing password prompts
# default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'
# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production


namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end
