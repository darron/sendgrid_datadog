require 'sinatra'
require 'dogapi'
require 'yaml'
require 'pp'

post "/#{ENV['BASE_URL']}/" do
  @json = JSON.parse(request.body.read)

  points = []

  @json.each do |event|
    record = { 'metric_name' => event['event'], 'timestamp' => event['timestamp'] }
    record['tags'] = { 'ip' => event['ip'] } unless event['ip'].nil?
    points << record
  end

  dog = Dogapi::Client.new(ENV['DD_API_KEY'])

  points.each do |point|
    tags = []
    unless point['tags'].nil?
      point['tags'].each {|key, value|
        tags << "#{key}:#{value}"
      }
    end
    tags << "event_type:#{point['metric_name']}"
    dog.emit_point('sendgrid.event', 1, tags: tags, metric_type: 'counter')
  end
  '200'
end

get "/" do
  '200'
end
