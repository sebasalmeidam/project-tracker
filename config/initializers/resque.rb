require 'resque/failure/multiple'
require 'resque/failure/redis'
Resque::Failure::Multiple.classes = [Resque::Failure::Redis]
Resque::Failure.backend = Resque::Failure::Multiple
Dir[File.join(Rails.root, 'app', 'jobs', '*.rb')].each { |file| require file }
config = YAML.load(File.open("#{Rails.root}/config/resque.yml"))[Rails.env]
Resque.redis = Redis.new(host: config['host'], port: config['port'], db: config['db'])
