require 'pathname'
path = Pathname.new(__FILE__).realpath # 当前文件完整路径
path = path.sub('/config/puma.rb', '')
APP_PATH = path.to_s

bind "#{APP_PATH}/tmp/puma.sock"
pidfile "#{APP_PATH}/tmp/puma.pid"
rackup "#{APP_PATH}/config.ru"
