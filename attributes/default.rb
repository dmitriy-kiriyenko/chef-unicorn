default['unicorn']['installs'] = []

default['unicorn']['config']['generate']          = true
default['unicorn']['config']['path']              = "/etc/unicorn/#{node['unicorn']['rack_env']}.rb"
default['unicorn']['config']['stderr_path']       = "#{node['unicorn']['app_root']}/log/unicorn.log"
default['unicorn']['config']['stdout_path']       = "#{node['unicorn']['app_root']}/log/unicorn.log"
default['unicorn']['config']['listen']            = [['8080', '{ :tcp_nodelay => true, :tries => 5 }']]
default['unicorn']['config']['worker_timeout']    = 60
default['unicorn']['config']['preload_app']       = false
default['unicorn']['config']['worker_processes']  = [node['cpu']['total'].to_i * 4, 8].min
default['unicorn']['config']['before_exec']       = nil
default['unicorn']['config']['before_fork']       = nil
default['unicorn']['config']['after_fork']        = nil

default['unicorn']['rack_env']     = 'production'
default['unicorn']['user']         = 'root'
default['unicorn']['group']        = 'root'
default['unicorn']['pid']          = "#{node['unicorn']['app_root']}/tmp/pids/unicorn.pid"
default['unicorn']['service']      = "unicorn-#{node['unicorn']['rack_env']}"
default['unicorn']['run_service']  = true
default['unicorn']['command']      = "cd #{node['unicorn']['app_root']} && bundle exec unicorn -D -E #{node['unicorn']['rack_env']} -c #{node['unicorn']['config']['path']}"
