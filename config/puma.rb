environment ENV['RAILS_ENV'] || 'production'
bind 'unix:///tmp/dirtShirts.sock'
daemonize false

workers    1    # should be same number of your CPU core
threads    1, 3 # min, max

pidfile    "/home/hkrdrm/tmp/puma/puma_dirtShirts.pid" # puma folder must exist
state_path "/home/hkrdrm/tmp/puma/state"
activate_control_app
