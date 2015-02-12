require 'dogapi'
require 'yaml'
require 'json'
# require 'pp'

config = YAML.load_file('datadog.yml')

# file = File.open('sendgrid.json', 'rb')
# contents = file.read
# file.close
# params = JSON.parse(contents)

points = []

params.each do |event|
  record = { 'metric_name' => event['event'], 'timestamp' => event['timestamp'] }
  record['tags'] = { 'ip' => event['ip'] } unless event['ip'].nil?
  points << record
end

dog = Dogapi::Client.new(config['datadog']['api_key'])

points.each do |point|
  tags = []
  unless point['tags'].nil?
    point['tags'].each {|key, value|
      tags << "#{key}:#{value}"
    }
  end
  dog.emit_point("sendgrid.#{point['metric_name']}", 1, tags: tags)
end
