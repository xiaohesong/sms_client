# encoding: utf-8
require 'bunny'

module SmsClient
  class Publisher
    extend Forwardable

    def_delegators :setting, :connect, :exchange, :queue, :bindings

    attr_accessor :connection

    def initialize(options = {})
      puts "loading publisher client"
      @connection = Bunny.new(options).tap do |c|
        c.start
      end
    end
    
    # to: String Or Array
    def publish(to, message)
      mobile = SmsClient::Mobile.new(to)
      ex.publish({mobile: mobile.mobile, message: message}.to_json, :routing_key => 'zcq.sms') if mobile.valid?
    end

    def connected?
      @connection && @connection.connected?
    end

    private

    def setting
      SmsClient.setting
    end

    def ex
      x = channel.exchange(exchange.name, exchange.symbolize_keys)
      q = channel.queue(queue.name, queue.symbolize_keys)
      raise SmsClient::ConfigurationError.new("不存在exchange为#{x.name}到queue为#{q.name}的binding, 为了避免发送消息的丢失，请添加相应的配置") unless bids.present?
      bids.each {|b| q.bind(x, routing_key: b.routing_key)}
      x
    end

    def channel
      @channel ||= connection.create_channel
    end

    def bids
      bindings.select {|b| b.source == exchange.name && b.destination == queue.name}
    end

  end
end
