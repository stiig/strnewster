require 'sshkit/sudo'
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/puma'
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/upload-config'
# require 'capistrano/puma/jungle'
# require 'capistrano/puma/nginx'
# require 'capistrano/puma/workers'
# require 'capistrano/puma/monit'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
