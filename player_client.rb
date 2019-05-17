require 'faye/websocket'
require 'eventmachine'
require 'json'
require './decider.rb'

EM.run do
  ws = Faye::WebSocket::Client.new('ws://confused-prisoner.herokuapp.com')

  puts 'Hey, I am working'
  ws.on :open do |event|
    ws.send("Name: Mike 'N Ikevan")
  end

  ws.on :message do |event|
    json_data = JSON.parse(event.data)
    puts json_data

    move = Decider.decide(json_data['game_history'])

    ws.send({ move: move }.to_json)
  end

  ws.on :close do |event|
    p [:close, event.code, event.reason]
    ws = nil
  end
end
