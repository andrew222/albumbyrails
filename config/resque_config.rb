require 'yaml'
require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'

Resque.schedule = YAML.load_file(File.join(File.dirname(__FILE__), "/resque_schedule.yml").to_s)