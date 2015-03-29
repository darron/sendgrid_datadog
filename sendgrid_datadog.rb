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
  tags << "event_type:#{point['metric_name']}"
  dog.emit_point('sendgrid.event', 1, tags: tags, metric_type: 'counter', host: 'sendgrid')
end
